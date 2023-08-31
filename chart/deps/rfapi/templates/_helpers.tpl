{{/*
Expand the name of the chart.
*/}}
{{- define "rfapi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rfapi.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rfapi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rfapi.labels" -}}
helm.sh/chart: {{ include "rfapi.chart" . }}
{{ include "rfapi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rfapi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rfapi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rfapi.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rfapi.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "rfapi.ingress.apiVersion" -}}
  {{- if and (.Capabilities.APIVersions.Has "autoscaling/v2") (semverCompare ">= 1.23" .Capabilities.KubeVersion.Version) -}}
      {{- print "autoscaling/v2" -}}  
  {{- else if .Capabilities.APIVersions.Has "autoscaling/v2beta2" -}}
      {{- print "autoscaling/v2beta2" -}}
  {{- else if .Capabilities.APIVersions.Has "autoscaling/v2beta1" -}}
      {{- print "autoscaling/v2beta1" -}}
  {{- else -}}
    {{- print "autoscaling/v1" -}}
  {{- end -}}
{{- end -}}