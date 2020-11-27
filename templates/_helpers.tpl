{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "rawdata.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "rawdata.api.name" -}}
  {{- printf "%s" .Values.api.name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.subscriber.name" -}}
  {{- printf "%s" .Values.subscriber.name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.runner.name" -}}
  {{- printf "%s" .Values.runner.name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.deadletterhandler.name" -}}
  {{- printf "%s" .Values.deadletterhandler.name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.migration.name" -}}
  {{- printf "%s" .Values.migration.name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.secret.name" -}}
  {{- printf "%s" .Values.servicesecret | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.subscriber.cm.name" -}}
  {{- printf "%s" .Values.subscriber.configmap | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.runner.cm.name" -}}
  {{- printf "%s" .Values.runner.configmap | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.deadletterhandler.cm.name" -}}
  {{- printf "%s" .Values.deadletterhandler.configmap | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.api.cm.name" -}}
  {{- printf "%s" .Values.api.configmap | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "rawdata.subscriber.image" -}}
   {{- $tag := .Values.subscriber.image.tag | default .Chart.AppVersion | toString -}}
   {{- printf "%s:%s" .Values.subscriber.image.repository $tag -}}
{{- end -}}

{{- define "rawdata.runner.image" -}}
   {{- $tag := .Values.runner.image.tag | default .Chart.AppVersion | toString -}}
   {{- printf "%s:%s" .Values.runner.image.repository $tag -}}
{{- end -}}

{{- define "rawdata.deadletterhandler.image" -}}
   {{- $tag := .Values.deadletterhandler.image.tag | default .Chart.AppVersion | toString -}}
   {{- printf "%s:%s" .Values.deadletterhandler.image.repository $tag -}}
{{- end -}}

{{- define "rawdata.api.image" -}}
   {{- $tag := .Values.api.image.tag | default .Chart.AppVersion | toString -}}
   {{- printf "%s:%s" .Values.api.image.repository $tag -}}
{{- end -}}

{{- define "rawdata.migration.image" -}}
   {{- $tag := .Values.migration.image.tag | default .Chart.AppVersion | toString -}}
   {{- printf "%s:%s" .Values.migration.image.repository $tag -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rawdata.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "rawdata.projectspace" -}}
{{- printf "%s" .Values.projectspace }}
{{- end }}

{{- define "rawdata.environment" -}}
{{- printf "%s" .Values.envtype }}
{{- end }}

{{- define "rawdata.labels" -}}
helm.sh/chart: {{ include "rawdata.chart" . | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
environment: {{ include "rawdata.environment" . | quote }}
projectspace: {{ include "rawdata.projectspace" . | quote }}
{{- end -}}

{{- define "rawdata.api.annotations" -}}
cert-manager.io/cluster-issuer: {{ include "rawdata.issuer" . | quote }}
kubernetes.io/ingress.class: "nginx"
nginx.ingress.kubernetes.io/enable-cors: "true"
{{- end -}}

{{- define "rawdata.subscriber.selectorLabels" -}} 
app.kubernetes.io/name: {{ include "rawdata.subscriber.name" . | quote }} 
{{- end }}

{{- define "rawdata.runner.selectorLabels" -}} 
app.kubernetes.io/name: {{ include "rawdata.runner.name" . | quote }} 
{{- end }}

{{- define "rawdata.deadletterhandler.selectorLabels" -}} 
app.kubernetes.io/name: {{ include "rawdata.deadletterhandler.name" . | quote }} 
{{- end }}

{{- define "rawdata.api.selectorLabels" -}} 
app.kubernetes.io/name: {{ include "rawdata.api.name" . | quote }} 
{{- end }}





