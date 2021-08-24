
#?user={{ .username }}&password={{ .password }}
{{- define "postgres.jdbcurl" -}}
{{- $host := (include "postgres.jdbc.host" .) -}}
{{- $port := (include "utils.call-nested" (list . "postgresql" "postgresql.port")) -}}
{{- $database := (include "utils.call-nested" (list . "postgresql" "postgresql.database")) -}}
{{- $args := (include "postgres.jdbcurl.args" .) -}}
{{ printf "sql:jdbc:postgresql://%s:%s/%s?%s" $host $port $database $args }}
{{- end -}}

{{- define "postgres.jdbc.host" -}}
{{- if .Values.postgresql.create -}}
{{- $host := (include "utils.call-nested" (list . "postgresql" "postgresql.primary.fullname")) -}}
{{ printf "%s" $host }}
{{- else -}}
{{ .Values.postgresql.host }}
{{- end -}}
{{- end -}}

{{- define "postgres.jdbcurl.args" -}}
{{include "postgres.jdbc.username" . | trimPrefix "&"}}{{ include "postgres.jdbc.password" . }}{{ include "postgres.jdbc.ssl" . }}{{ include "postgres.jdbc.extraOpts" . }}
{{- end -}}

{{- define "postgres.jdbc.username" -}}
&user={{ include "utils.call-nested" (list . "postgresql" "postgresql.username") }}
{{- end -}}

{{- define "postgres.jdbc.password" -}}
&password={{ include "utils.call-nested" (list . "postgresql" "postgresql.password") }}
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
