{{/* vim: set filetype=mustache: */}}

{{/*
Create a random alphanumeric password string.
We append a random number to the string to avoid password validation errors
*/}}
{{- define "sextant.randomPassword" -}}
{{- randAlphaNum 25 -}}{{- randNumeric 1 -}}
{{- end -}}

{{/*
{{ include "sextant.image" (dict "imageRoot" .Values.sawtooth.containers.validator.image "editionRoot" .Values.editionImages.api "edition" .Values.edition "global" .Values.global)}}
*/}}
{{- define "sextant.image" -}}
image: {{ include "sextant.image.url" . }}
imagePullPolicy: {{ default "IfNotPresent" .imageRoot.pullPolicy }}
{{- end -}}

{{/*
{{ include "sextant.image.url" (dict "imageRoot" .Values.api.image "editionRoot" .Values.editionImages.api "edition" .Values.edition "global" .Values.global)}}
*/}}
{{- define "sextant.image.url" -}}
  {{- $registry := .imageRoot.registry -}}
  {{- $repository := .imageRoot.repository -}}
  {{- $tag := .imageRoot.tag -}}
  {{- if eq .edition "development" -}}
    {{- $registry = .imageRoot.registry -}}
    {{- $repository = .imageRoot.repository -}}
    {{- $tag = .imageRoot.tag -}}
  {{- else if eq .edition "aws-standard" -}}
    {{- $registry = .editionRoot.awsStandard.registry -}}
    {{- $repository = .editionRoot.awsStandard.repository -}}
    {{- $tag = .editionRoot.awsStandard.tag -}}
  {{- else if eq .edition "aws-premium" -}}
    {{- $registry = .editionRoot.awsPremium.registry -}}
    {{- $repository = .editionRoot.awsPremium.repository -}}
    {{- $tag = .editionRoot.awsPremium.tag -}}
  {{- else if eq .edition "aws-enterprise" -}}
    {{- $registry = .editionRoot.awsEnterprise.registry -}}
    {{- $repository = .editionRoot.awsEnterprise.repository -}}
    {{- $tag = .editionRoot.awsEnterprise.tag -}}
  {{- else if eq .edition "enterprise" -}}
    {{- $registry = .editionRoot.enterprise.registry -}}
    {{- $repository = .editionRoot.enterprise.repository -}}
    {{- $tag = .editionRoot.enterprise.tag -}}
  {{- else -}}
    {{- $registry = .imageRoot.registry -}}
    {{- $repository = .imageRoot.repository -}}
    {{- $tag = .imageRoot.tag -}}
  {{- end -}}
  {{- if $registry -}}
    {{- printf "%s/%s:%s" $registry $repository $tag -}}
  {{- else -}}
    {{- printf "%s:%s" $repository $tag -}}
  {{- end -}}
{{- end -}}
