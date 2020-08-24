{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "besu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "besu.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "besu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "besu.labels" -}}
app: {{ include "besu.name" . }}
chart: {{ include "besu.chart" . }}
heritage: {{ .Release.Service }}
namespace: {{ .Release.Namespace }}
release: {{ .Release.Name }}
{{ include "besu.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "besu.chart" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "besu.selectorLabels" -}}
app.kubernetes.io/name: {{ include "besu.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "besu.serviceAccountName" -}}
{{- if .Values.besu.serviceAccount.create -}}
    {{ default (include "besu.fullname" .) .Values.besu.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.besu.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "daml-on-besu.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "daml-on-besu.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "daml-on-besu.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "daml-on-besu.labels" -}}
app: {{ include "daml-on-besu.name" . }}-rpc
daml: {{ .Release.Name }}-daml-rpc
chart: {{ include "daml-on-besu.chart" . }}
heritage: {{ .Release.Service }}
namespace: {{ .Release.Namespace }}
release: {{ .Release.Name }}
{{ include "daml-on-besu.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "daml-on-besu.chart" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "daml-on-besu.selectorLabels" -}}
app.kubernetes.io/name: {{ include "daml-on-besu.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "daml-on-besu.serviceAccountName" -}}
{{- if .Values.besu.serviceAccount.create -}}
    {{ default (include "daml-on-besu.fullname" .) .Values.besu.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.besu.serviceAccount.name }}
{{- end -}}
{{- end -}}
