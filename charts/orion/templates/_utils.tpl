
{{/*
{{ include "utils.image.url" (dict "imageRoot" .Values.sawtooth.containers.validator.image "global" .Values.global)}}
*/}}
{{- define "utils.image.url" -}}
{{- $globalRegistryName := default "index.docker.io" .global.image.registry -}}
{{- $repository := .imageRoot.repository -}}
{{- $registryName := default $globalRegistryName .imageRoot.registry -}}
{{- $tag := default .global.image.tag .imageRoot.tag -}}
{{- printf "%s/%s:%s" $registryName $repository $tag -}}
{{- end -}}

{{/*
{{ include "utils.image" (dict "imageRoot" .Values.sawtooth.containers.validator.image "global" .Values.global)}}
*/}}
{{- define "utils.image" -}}
image: {{ include "utils.image.url" . }}
imagePullPolicy: {{ default "IfNotPresent" .imageRoot.pullPolicy }}
{{- end -}}

{{/* */}}
{{- define "utils.hostaliases" -}}
{{- if .Values.hostAliases -}}
{{ toYaml .Values.hostAliases }}
{{- end -}}
{{- end -}}

{{- define "utils.k8s.image" -}}
{{- include "utils.image" (dict "imageRoot" .Values.utils.k8s.image "global" .Values.global) -}}
{{- end -}}

{{- define "utils.rand.vols" -}}
- name: dev-random
  hostPath:
    path: /dev/random
    type: CharDevice
- name: dev-urandom
  hostPath:
    path: /dev/urandom
    type: CharDevice
{{- end -}}

{{- define "utils.rand.mounts" -}}
- mountPath: /dev/random
  name: dev-random
- mountPath: /dev/urandom
  name: dev-urandom
{{- end -}}
