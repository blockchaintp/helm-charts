{{- define "tfs.affinity" -}}
{{- if .Values.affinity -}}
{{- toYaml .Values.affinity }}
{{- end -}}
{{- end -}}

{{- define "tfs.kind" -}}
{{ include "lib.call-nested" (list . "sawtooth" "sawtooth.kind") }}
{{- end -}}

{{- define "tfs.replicas" -}}
{{ include "lib.call-nested" (list . "sawtooth" "sawtooth.replicas") | int }}
{{- end -}}

{{- define "tfs.sawtooth.restport" -}}
8008
{{- end -}}

{{- define "tfs.middleware.containerPort" -}}
8000
{{- end -}}

{{- define "tfs.s3.containerPort" -}}
8001
{{- end -}}

{{- define "tfs.sawtooth.sawcomp" -}}
4004
{{- end -}}

{{- define "tfs.field.node" -}}
{{ $kind := include "tfs.kind" . }}
{{- if eq $kind "DaemonSet" -}}
spec.nodeName
{{- else -}}
metadata.name
{{- end -}}
{{- end -}}}
