{{- define "pgqldb.jdbcurl" -}}
{{- $host := (include "pgqldb.jdbc.host" .) -}}
{{- $port := (include "utils.call-nested" (list . "postgresqlqldb"  "postgresql.port")) -}}
{{- $database := (include "utils.call-nested" (list . "postgresqlqldb"  "postgresql.database"))  -}}
{{- $args := (include "pgqldb.jdbcurl.args" .) -}}
{{ printf "jdbc:postgresql://%s:%s/%s?%s" $host $port $database $args }}
{{- end -}}

{{- define "pgqldb.jdbc.host" -}}
{{- if .Values.postgresqlqldb.create -}}
{{- $host := (include "utils.call-nested" (list . "postgresqlqldb" "postgresql.primary.fullname")) -}}
{{ printf "%s" $host }}
{{- else -}}
{{ .Values.postgresqlqldb.host }}
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbcurl.args" -}}
{{- include "pgqldb.jdbc.username" . | trimPrefix "&" | trim }}{{- include "pgqldb.jdbc.password" . | trim}}{{- include "pgqldb.jdbc.ssl" . }}{{- include "pgqldb.jdbc.extraOpts" . }}
{{- end -}}

{{- define "pgqldb.jdbc.username" -}}
&user={{- include "utils.call-nested" (list . "postgresqlqldb" "postgresql.username") }}
{{- end -}}

{{- define "pgqldb.jdbc.password" -}}
&password={{- include "utils.call-nested" (list . "postgresqlqldb" "postgresql.password") }}
{{- end -}}

{{- define "pgqldb.jdbc.ssl" -}}
{{- if .ssl -}}
&ssl=true
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbc.extraOpts" -}}
{{- if .extraOpts -}}
&{{ .extraOpts }}
{{- end -}}
{{- end -}}


#?user={{ .username }}&password={{ .password }}
{{- define "pgidxdb.jdbcurl" -}}
{{- $host := (include "pgidxdb.jdbc.host" .) -}}
{{- $port := (include "utils.call-nested" (list . "postgresqlidx"  "postgresql.port")) -}}
{{- $database := (include "utils.call-nested" (list . "postgresqlidx"  "postgresql.database"))  -}}
{{- $args := (include "pgidxdb.jdbcurl.args" .) -}}
{{ printf "jdbc:postgresql://%s:%s/%s?%s" $host $port $database $args }}
{{- end -}}

{{- define "pgidxdb.jdbc.host" -}}
{{- if .Values.postgresqlidx.create -}}
{{- $host := (include "utils.call-nested" (list . "postgresqlidx" "postgresql.primary.fullname")) -}}
{{ printf "%s" $host }}
{{- else -}}
{{ .Values.postgresqlidx.host }}
{{- end -}}
{{- end -}}

{{- define "pgidxdb.jdbcurl.args" -}}
{{- include "pgidxdb.jdbc.username" . | trimPrefix "&" | trim }}{{- include "pgidxdb.jdbc.password" . | trim }}{{- include "pgidxdb.jdbc.ssl" . }}{{- include "pgidxdb.jdbc.extraOpts" . }}
{{- end -}}

{{- define "pgidxdb.jdbc.username" -}}
&user={{- include "utils.call-nested" (list . "postgresqlidx" "postgresql.username") }}
{{- end -}}

{{- define "pgidxdb.jdbc.password" -}}
&password={{- include "utils.call-nested" (list . "postgresqlidx" "postgresql.password") }}
{{- end -}}

{{- define "pgidxdb.jdbc.ssl" -}}
{{- if .ssl -}}
&ssl=true
{{- end -}}
{{- end -}}

{{- define "pgidxdb.jdbc.extraOpts" -}}
{{- if .extraOpts -}}
&{{ .extraOpts }}
{{- end -}}
{{- end -}}

