
{{/*
Orion image
*/}}
{{- define "orion.image" -}}
{{- include "utils.image" (dict "imageRoot" .Values.orion.image "global" .Values.global) -}}
{{- end -}}

{{- define "orion.svc.ports" -}}
- name: nodeport
  port: {{ .Values.orion.nodeport}}
  targetPort: {{.Values.orion.nodeport}}
- name: clientport
  port: {{ .Values.orion.clientport}}
  targetPort: {{.Values.orion.clientport}}
{{- end -}}

{{- define "orion.publickeys.list" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{- range untilStep 0 (int .Values.orion.replicas) 1 -}}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
,"/secrets/pubkeys/{{ $nodeName }}/orion.pub"
{{- end -}}
{{- end -}}

{{- define "orion.publickeys.vols" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{ range untilStep 0 (int .Values.orion.replicas) 1 }}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
- name: {{$nodeName}}-pubkey
  configMap:
    name: {{ $secretName }}-pub
{{ end }}
{{- end -}}

{{- define "orion.publickeys.mounts" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{ range untilStep 0 (int .Values.orion.replicas) 1 }}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
- name: {{$nodeName}}-pubkey
  mountPath: /secrets/pubkeys/{{ $nodeName }}
{{ end }}
{{- end -}}

{{- define "orion.privatekeys.list" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{- range untilStep 0 (int .Values.orion.replicas) 1 -}}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
,"/secrets/keys/{{ $nodeName }}/orion.key"
{{- end -}}
{{- end -}}

{{- define "orion.privatekeys.vols" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{ range untilStep 0 (int .Values.orion.replicas) 1 }}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
- name: {{$nodeName}}
  secret:
    secretName: {{ $secretName }}
{{ end }}
{{- end -}}

{{- define "orion.privatekeys.mounts" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{ range untilStep 0 (int .Values.orion.replicas) 1 }}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
{{- $secretName := printf "%s-nodekey" $nodeName -}}
- name: {{$nodeName}}
  mountPath: /secrets/keys/{{ $nodeName }}
{{ end }}
{{- end -}}

{{- define "orion.othernodes.list" -}}
{{- $nodeNameStub := printf "%s" (include "common.fullname" .) -}}
{{ $ctx := .}}
{{- range untilStep 0 (int .Values.orion.replicas) 1 -}}
,{{ printf "http://%s-%d:%0.0f" $nodeNameStub . $ctx.Values.orion.nodeport | quote }}
{{- end -}}
{{- range .Values.orion.othernodes -}}
{{- $nodeName := printf "%s-%d" $nodeNameStub . -}}
,{{ . | quote }}
{{- end -}}
{{- end -}}0

{{- define "orion.storage" -}}
{{- if eq .Values.orion.storage "postgres" -}}
{{ include "postgres.jdbcurl" . }}
{{- else -}}
{{.Values.orion.storage}}
{{- end -}}
{{- end -}}

{{- define "orion.nodeurl" -}}
{{- if .Values.orion.nodeurl -}}
{{.Values.orion.nodeurl}}
{{- else -}}
{{- $svcName := (include "common.fullname" . ) -}}
{{- $ns := .Release.Namespace -}}
{{- $port := .Values.orion.nodeport -}}
{{ printf "http://%s.%s.svc.cluster.local:%0.0f" $svcName $ns $port }}
{{- end -}}
{{- end -}}
