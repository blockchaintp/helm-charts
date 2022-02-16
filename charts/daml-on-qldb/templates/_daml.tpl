{{- define "daml.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "daml.fullname" -}}
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
{{- define "daml.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "daml.labels.appLabels" -}}
app: {{ include "common.names.fullname" . }}
daml: {{ include "common.names.fullname" . }}
{{- end -}}

{{- define "daml.labels" -}}
{{ include "lib.labels" . }}
{{ include "daml.labels.appLabels" . }}
{{- end -}}

{{- define "daml.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{ include "daml.labels.appLabels" . }}
{{- end -}}

{{- define "daml.kind" -}}
{{ include "lib.call-nested" (list . "sawtooth" "sawtooth.kind") }}
{{- end -}}

{{- define "daml.replicas" -}}
{{ include "lib.call-nested" (list . "sawtooth" "sawtooth.replicas") | int }}
{{- end -}}

{{- define "daml.trigger.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s-triggers" $svc }}
{{- end -}}

{{- define "daml.jsonapi.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s-jsonapi" $svc }}
{{- end -}}

{{- define "daml.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s" $svc }}
{{- end -}}

{{- define "daml.service" -}}
{{- $svc := include "daml.service.name" . -}}
{{- $ns := .Release.Namespace -}}
{{- $domain := "svc.cluster.local" -}}
{{ printf "%s.%s.%s" $svc $ns $domain }}
{{- end -}}


{{- define "daml.field.node" -}}
{{ $kind := include "daml.kind" . }}
{{- if eq $kind "DaemonSet" -}}
spec.nodeName
{{- else -}}
metadata.name
{{- end -}}
{{- end -}}}

{{/*
  Return the participant id to be used in this chart
*/}}
{{- define "daml.participantId" -}}
{{- if .Values.participantId -}}
{{- .Values.participantId -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
