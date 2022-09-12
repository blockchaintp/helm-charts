
{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-orderer.labels" -}}
{{ include "lib.labels" . }}
app: {{ include "common.names.fullname" . }}
{{- end -}}

{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-orderer.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{- end -}}


{{- define "fabric-orderer.names.server" -}}
{{ include "common.names.fullname" . }}
{{- end -}}

{{- define "fabric-orderer.names.orderer-config" -}}
{{ include "common.names.fullname" . }}-orderer-config
{{- end -}}

{{- define "fabric-orderer.names.msp-config" -}}
{{ include "common.names.fullname" . }}-msp-config
{{- end -}}

{{- define "fabric-orderer.names.ca-cert" -}}
{{ include "lib.call-nested" (list . "ordererca" "fabric-ca.names.ca-cert") }}
{{- end -}}

{{- define "fabric-orderer.names.ca" -}}
{{ include "lib.call-nested" (list . "ordererca" "fabric-ca.names.server") }}
{{- end -}}
