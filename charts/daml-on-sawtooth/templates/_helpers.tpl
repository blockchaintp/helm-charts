
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

{{/*
Return true if a secret should be created for PagerDuty
*/}}
{{- define "pagerduty.createSecret" -}}
{{- if (not .Values.pagerduty.existingSecret) }}
    {{- true -}}
{{- end -}}
{{- end -}}
