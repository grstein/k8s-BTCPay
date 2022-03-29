{{/*
Expand the name of the chart.
*/}}
{{- define "btcpayserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "nbxplorer.name" -}}
{{- default "nbxplorer" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "bitcoind.name" -}}
{{- default "bitcoind" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "btcpayserver.fullname" -}}
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
{{- define "btcpayserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "btcpayserver.labels" -}}
helm.sh/chart: {{ include "btcpayserver.chart" . }}
{{ include "btcpayserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "nbxplorer.labels" -}}
helm.sh/chart: {{ include "btcpayserver.chart" . }}
{{ include "btcpayserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "bitcoind.labels" -}}
helm.sh/chart: {{ include "btcpayserver.chart" . }}
{{ include "btcpayserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "btcpayserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "btcpayserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "nbxplorer.selectorLabels" -}}
app.kubernetes.io/name: nbxplorer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "bitcoind.selectorLabels" -}}
app.kubernetes.io/name: bitcoind
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "btcpayserver.serviceAccountName" -}}
{{- if .Values.btcpayserver.serviceAccount.create }}
{{- default (include "btcpayserver.fullname" .) .Values.btcpayserver.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.btcpayserver.serviceAccount.name }}
{{- end }}
{{- end }}
