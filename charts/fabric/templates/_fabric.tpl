
{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric.labels" -}}
{{ include "lib.labels" . }}
app: {{ include "common.names.fullname" . }}
{{- end -}}

{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{- end -}}
