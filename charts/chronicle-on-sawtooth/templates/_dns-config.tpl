{{/* DNS Configuration Helper Template */}}
{{- define "chronicle.dnsConfig" -}}
dnsPolicy: "None"
dnsConfig:
  nameservers:
  - {{ .Values.global.dnsConfig.nameserver }}
  searches:
  - {{ .Release.Namespace }}.svc.{{ .Values.global.dnsConfig.customDomain }}
  - svc.{{ .Values.global.dnsConfig.customDomain }}
  - {{ .Values.global.dnsConfig.customDomain }}
  - {{ .Values.global.dnsConfig.awsRegion }}.compute.internal
  options:
  - name: ndots
    value: "5"
{{- end -}}
