kubectl create configmap config \
  --from-file=config.yaml=config/prow/config.yaml \
  --dry-run -o yaml | kubectl replace configmap config -f -