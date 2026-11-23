{{/*
Expand the name of the chart.
*/}}
{{- define "metabase.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "metabase.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "metabase.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "metabase.labels" -}}
helm.sh/chart: {{ include "metabase.chart" . }}
{{ include "metabase.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "metabase.selectorLabels" -}}
app.kubernetes.io/name: {{ include "metabase.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "metabase.serviceAccountName" -}}
{{- if and .Values.serviceAccount .Values.serviceAccount.create .Values.serviceAccount.name (ne .Values.serviceAccount.name "") }}
{{- .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the vault service account to use
*/}}
{{- define "metabase.vaultServiceAccountName" -}}
{{- if and .Values.vault.serviceAccount .Values.vault.serviceAccount.name (ne .Values.vault.serviceAccount.name "") }}
{{- .Values.vault.serviceAccount.name }}
{{- else }}
{{- printf "vault-%s-sa" .Values.global.service_name }}
{{- end }}
{{- end }}

{{/*
Environment shared by the metabase container and the enable-encryption init
container, so both connect to the same application database with the same key.
*/}}
{{- define "metabase.containerEnv" -}}
envFrom:
- configMapRef:
    name: {{ .Values.global.service_name }}-config
env:
{{- if .Values.metabase.javaToolOptions }}
- name: JAVA_TOOL_OPTIONS
  value: {{ .Values.metabase.javaToolOptions | quote }}
{{- end }}
{{- range .Values.metabase.secretsVars }}
{{- $secretName := .name }}
{{- range .envVars }}
- name: {{ .name }}
  valueFrom:
    secretKeyRef:
      name: {{ $secretName }}
      key: {{ .key }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Reject encryption bootstrap settings that would let a pod read or write the
application database while enable-encryption runs: a RollingUpdate keeps old
pods (without the key) serving, and several replicas would run the init
container concurrently.
*/}}
{{- define "metabase.validateEncryptionBootstrap" -}}
{{- if ne .Values.metabase.strategy "Recreate" }}
{{- fail "metabase.encryption.bootstrap requires metabase.strategy=Recreate" }}
{{- end }}
{{- if ne (int .Values.metabase.replicas) 1 }}
{{- fail "metabase.encryption.bootstrap requires metabase.replicas=1" }}
{{- end }}
{{- $hasKey := false }}
{{- range .Values.metabase.secretsVars }}
{{- range .envVars }}
{{- if eq .name "MB_ENCRYPTION_SECRET_KEY" }}
{{- $hasKey = true }}
{{- end }}
{{- end }}
{{- end }}
{{- if not $hasKey }}
{{- fail "metabase.encryption.bootstrap requires MB_ENCRYPTION_SECRET_KEY in metabase.secretsVars" }}
{{- end }}
{{- end }}
