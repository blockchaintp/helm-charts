{{- define "pgqldb.jdbcurl" -}}
{{- $host := (include "pgqldb.jdbc.host" .) -}}
{{- $port := (include "pgqldb.jdbc.host" .) -}}
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
{{ .Values.postgresqlqldb.external.host }}
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbc.port " -}}
{{- if .Values.postgresqlqldb.create -}}
{{- $port := (include "utils.call-nested" (list . "postgresqlqldb" "postgresql.port ")) -}}
{{ printf "%s" $port }}
{{- else -}}
{{ .Values.postgresqlqldb.external.port }}
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbc.database" -}}
{{- if .Values.postgresqlqldb.create -}}
{{- $port := (include "utils.call-nested" (list . "postgresqlqldb" "postgresql.database")) -}}
{{ printf "%s" $port }}
{{- else -}}
{{ .Values.postgresqlqldb.external.port }}
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbcurl.args" -}}
{{- include "pgqldb.jdbc.username" . | trimPrefix "&" | trim }}{{- include "pgqldb.jdbc.password" . | trim}}
{{- end -}}

{{- define "pgqldb.jdbc.username" -}}
{{- if .Values.postgresqlqldb.create -}}
&user={{- include "utils.call-nested" (list . "postgresqlqldb" "postgresql.username") }}
{{- else -}}
&user={{ .Values.postgresqlqldb.external.user }}
{{- end -}}
{{- end -}}

{{- define "pgqldb.jdbc.password" -}}
{{- if .Values.postgresqlqldb.create -}}
&password={{- include "utils.call-nested" (list . "postgresqlqldb" "postgresql.password") }}
{{- else -}}
&password={{ .Values.postgresqlqldb.external.password }}
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
{{ .Values.postgresqlidx.external.host }}
{{- end -}}
{{- end -}}

{{- define "pgidxdb.jdbcurl.args" -}}
{{- include "pgidxdb.jdbc.username" . | trimPrefix "&" | trim }}{{- include "pgidxdb.jdbc.password" . | trim }}
{{- end -}}

{{- define "pgidxdb.jdbc.username" -}}
{{- if .Values.postgresqlidx.create -}}
&user={{- include "utils.call-nested" (list . "postgresqlidx" "postgresql.username") }}
{{- else -}}
&user={{ .Values.postgresqlidx.external.user }}
{{- end -}}
{{- end -}}

{{- define "pgidxdb.jdbc.password" -}}
{{- if .Values.postgresqlidx.create -}}
&password={{- include "utils.call-nested" (list . "postgresqlidx" "postgresql.password") }}
{{- else -}}
&password={{ .Values.postgresqlidx.external.password }}
{{- end -}}
{{- end -}}
