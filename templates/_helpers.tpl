{{/*
Annotations for one rendered object: the item's own, plus anything global.

Exists for sync waves. When this chart is a second source alongside an
application's own chart, its objects have to land BEFORE the workload - an
ExternalSecret that arrives after the Deployment that mounts it means a pod that
starts, fails to find its secret, and backs off. Setting global.syncWave to a
negative number stamps every object here with it, so ordering is a property of
the chart rather than something each caller remembers.

Per-item annotations win. crossplane-manifests already sets its own waves to
order a Provider before the ProviderConfig that references it, and a global
default must not overwrite that - so the global wave is only applied when the
item has not asked for one.

Usage: {{- include "lib.annotations" (dict "item" . "global" $.Values.global) | nindent 2 }}
*/}}
{{- define "lib.annotations" -}}
{{- $item := .item | default dict -}}
{{- $global := .global | default dict -}}
{{- $ann := dict -}}
{{- range $k, $v := ($global.annotations | default dict) }}{{- $_ := set $ann $k $v }}{{- end -}}
{{- range $k, $v := ($item.annotations | default dict) }}{{- $_ := set $ann $k $v }}{{- end -}}
{{- if and $global.syncWave (not (hasKey $ann "argocd.argoproj.io/sync-wave")) -}}
{{- $_ := set $ann "argocd.argoproj.io/sync-wave" (toString $global.syncWave) -}}
{{- end -}}
{{- with $ann }}
annotations:
{{- toYaml . | nindent 2 }}
{{- end -}}
{{- end -}}
