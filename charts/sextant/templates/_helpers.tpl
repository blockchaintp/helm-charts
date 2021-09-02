{{/* vim: set filetype=mustache: */}}

{{/*
Create a random alphanumeric password string.
We append a random number to the string to avoid password validation errors
*/}}
{{- define "sextant.randomPassword" -}}
{{- randAlphaNum 25 -}}{{- randNumeric 1 -}}
{{- end -}}
