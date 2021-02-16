
{{/*
  Return the participant id to be used in this chart
*/}}
{{- define "daml.participantId" -}}
{{- if .Values.daml.participantId -}}
{{- .Values.daml.participantId -}}
{{- else -}}
{{- if .Values.sawtooth.networkName -}}
{{- .Values.sawtooth.networkName -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
