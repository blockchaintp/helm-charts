
{{/*
Call a template function in the context of a sub-chart, as opposed to the
current context of the caller
{{ include "lib.call-nested" (list . "subchart" "template_name") }}
*/}}
{{- define "lib.call-nested" }}
{{- $dot := index . 0 }}
{{- $subchart := index . 1 | splitList "." }}
{{- $template := index . 2 }}
{{- $values := $dot.Values }}
{{- range $subchart }}
{{- $values = index $values . }}
{{- end }}
{{- include $template (dict "Chart" (dict "Name" (last $subchart)) "Values" $values "Release" $dot.Release "Capabilities" $dot.Capabilities) }}
{{- end }}
