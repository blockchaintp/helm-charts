
{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-peer.labels" -}}
{{ include "lib.labels" . }}
app: {{ include "common.names.fullname" . }}
{{- end -}}

{{/*
Fabric-CA Selector labels
*/}}
{{- define "fabric-peer.labels.matchLabels" -}}
{{ include "common.labels.matchLabels" . }}
{{- end -}}


{{- define "fabric-peer.names.server" -}}
{{ include "common.names.fullname" . }}
{{- end -}}

{{- define "fabric-peer.names.peer-config" -}}
{{ include "common.names.fullname" . }}-peer-config
{{- end -}}

{{- define "fabric-peer.names.msp-config" -}}
{{ include "common.names.fullname" . }}-msp-config
{{- end -}}

{{- define "fabric-peer.names.ca-cert" -}}
{{ include "lib.call-nested" (list . "peerca" "fabric-ca.names.ca-cert") }}
{{- end -}}

{{- define "fabric-peer.names.ca" -}}
{{ include "lib.call-nested" (list . "peerca" "fabric-ca.names.server") }}
{{- end -}}
