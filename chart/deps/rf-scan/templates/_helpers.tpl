{{/*
Expand the name of the chart.
*/}}
{{- define "rf-scan.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rf-scan.fullname" -}}
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
{{- define "rf-scan.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rf-scan.labels" -}}
helm.sh/chart: {{ include "rf-scan.chart" . }}
{{ include "rf-scan.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rf-scan.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rf-scan.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rf-scan.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rf-scan.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "rf-scan.autoscaler.apiVersion" -}}
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