# create prow and prow-jobs namespace and set prow as current namespace
kubectl create namespace prow
kubectl create namespace prow-jobs
kubectl config set-context --current --namespace prow

# create hmac token for github webhook
openssl rand -hex 20 > secrets/hmac-token
kubectl create secret generic hmac-token --from-file=hmac=secrets/hmac-token

# create github oauth secret
kubectl create secret generic oauth-token  --from-file=oauth=secrets/oauth-token