mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=$HOME/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
kubectl create -f https://raw.githubusercontent.com/nestorsalceda/work-environment/master/helm-rbac/rbac-config.yaml
helm init --service-account tiller
sudo apt install python-pip zip
wget https://github.com/kubeless/kubeless/releases/download/v1.0.0-alpha.6/kubeless_linux-amd64.zip
unzip kubeless_linux-amd64.zip
sudo mv bundles/kubeless_linux-amd64/kubeless /usr/local/bin/
export LC_ALL=C
pip install --user pipenv
