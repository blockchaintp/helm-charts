{{/* vim: set filetype=mustache: */}}
{{/*
Common labels
*/}}
{{- define "lib.labels" -}}
helm.sh/chart: {{ include "common.names.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "common.labels.matchLabels" . }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "lib.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
