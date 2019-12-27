kubectl create configmap plugins \
  --from-file=plugins.yaml=config/prow/plugins.yaml \
  --dry-run -o yaml | kubectl replace configmap plugins -f -