{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{/*{{- define "name" -}}*/}}
{{/*{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}*/}}
{{/*{{- end -}}*/}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "provisioner.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "provisioner.labels" -}}
app.kubernetes.io/name: {{ include "provisioner.name" . }}
helm.sh/chart: {{ include "provisioner.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Utility function for joining Avs tag list into string.
*/}}
{{- define "avs.utils.joinTags" -}}
{{- $local := dict "first" true -}}
{{- range $k, $v := . -}}
{{- if not $local.first -}},{{- end -}}
{{ printf "{%q,%v,%q}" $v.content $v.tag_id $v.tag_name }}
{{- $_ := set $local "first" false -}}
{{- end -}}
{{- end -}}
