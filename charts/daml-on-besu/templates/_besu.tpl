
{{- define "besu.privacy.url" -}}
{{- if .Values.besu.privacy.enabled -}}
{{- if .Values.orion.create -}}
{{- $port := include "lib.call-nested" (list . "orion" "besu.orion.clientport") -}}
{{- $host := include "lib.call-nested" (list . "orion" "common.fullname") -}}
{{- printf "http://%s.%s.svc.cluster.local:%s" $host .Release.Namespace $port -}}
{{- else if .Values.besu.privacy.url -}}
{{ .Values.besu.privacy.url }}
{{- else -}}
http://127.0.0.1:8888
{{- end -}}
{{- end -}}
{{- end -}}

{{/* called within the context of the orion chart */}}
{{- define "besu.orion.clientport" -}}
{{ .Values.orion.clientport }}
{{- end -}}


{{- define "besu.enclave.key.secretName" -}}
{{- $nodeNameStub := printf "%s" (include "lib.call-nested" (list . "orion" "common.fullname")) -}}
{{- $nodeName := printf "%s-%d" $nodeNameStub 0 -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
{{- $secretName -}}
{{- end -}}

{{- define "besu.enclave.key.configmap" -}}
{{ include "besu.enclave.key.secretName" . }}-pub
{{- end -}}

{{- define "besu.repeater.key.secretName" -}}
{{- $nodeNameStub := printf "%s" (include "lib.call-nested" (list . "orion" "common.fullname")) -}}
{{- $nodeName := printf "%s-%d" $nodeNameStub 1 -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
{{- $secretName -}}
{{- end -}}

{{- define "besu.repeater.key.configmap" -}}
{{ include "besu.repeater.key.secretName" . }}-pub
{{- end -}}
