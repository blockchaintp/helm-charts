
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

{{- define "daml.sawtooth.sawcomp" -}}
{{ include "lib.call-nested" (list . "sawtooth" "sawtooth.ports.sawcomp") | int }}
{{- end -}}

{{- define "daml.sawtooth.service" -}}
{{- $svc := include "lib.call-nested" (list . "sawtooth" "common.names.fullname") -}}
{{- $ns := .Release.Namespace -}}
{{- $domain := "svc.cluster.local" -}}
{{ printf "%s.%s.%s" $svc $ns $domain }}
{{- end -}}

{{- define "daml.trigger.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s-triggers" $svc }}
{{- end -}}

{{- define "daml.jsonapi.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s-jsonapi" $svc }}
{{- end -}}

{{- define "daml.tp.service.name" -}}
{{- $svc := include "common.names.fullname" . -}}
{{ printf "%s-tp" $svc }}
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
