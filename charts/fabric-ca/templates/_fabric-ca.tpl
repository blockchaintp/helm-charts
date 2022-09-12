
{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-ca.labels" -}}
{{ include "lib.labels" . }}
app: {{ include "common.names.fullname" . }}
{{- end -}}

{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-ca.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{- end -}}


{{- define "fabric-ca.names.server" -}}
{{ include "common.names.fullname" . }}
{{- end -}}

{{- define "fabric-ca.names.server-configmap" -}}
{{ include "common.names.fullname" . }}-server-configmap
{{- end -}}

{{- define "fabric-ca.names.ca-cert" -}}
{{ include "common.names.fullname" . }}-cacerts
{{- end -}}
