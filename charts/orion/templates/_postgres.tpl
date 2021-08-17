
#?user={{ .username }}&password={{ .password }}
{{- define "postgres.jdbcurl" -}}
jdbc:postgresql://{{ default .host "localhost" }}:{{ default .port 5432 }}/{{ default .database "orion" }}?{{ include "postgres.jdbcurl.args" . }}
{{- end -}}

{{- define "postgres.jdbcurl.args" -}}
{{include "postgres.jdbc.username" . | trimPrefix "&"}}{{include "postgres.jdbc.password" .}}{{ include "postgres.jdbc.ssl" . }}{{ include "postgres.jdbc.extraOpts" . }}
{{- end -}}

{{- define "postgres.jdbc.username" -}}
&user={{ include "postgresql.username" (merge (dict) .postgresql .Values.postgresql) }}
{{- end -}}

{{- define "postgres.jdbc.password" -}}
{{- if not .existingSecret -}}
&password={{ .password }}
{{- end -}}
{{- end -}}

{{- define "postgres.jdbc.ssl" -}}
{{- if .ssl -}}
&ssl=true
{{- end -}}
{{- end -}}

{{- define "postgres.jdbc.extraOpts" -}}
{{- if .extraOpts -}}
&{{.extraOpts}}
{{- end -}}
{{- end -}}
