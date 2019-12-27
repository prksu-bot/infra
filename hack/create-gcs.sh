gcloud iam service-accounts create prow-gcs --display-name="Prow GCS"
identifier="$(gcloud iam service-accounts list --filter 'name:prow-gcs' --format 'value(email)')"
gsutil mb gs://prksu-prow-artifacts/
gsutil iam ch allUsers:objectViewer gs://prksu-prow-artifacts
gsutil iam ch "serviceAccount:${identifier}:objectAdmin" gs://prksu-prow-artifacts
gcloud iam service-accounts keys create --iam-account "${identifier}" secrets/service-account.json
kubectl create secret generic gcs-credentials --from-file=secrets/service-account.json
kubectl -n prow-jobs create secret generic gcs-credentials --from-file=secrets/service-account.json