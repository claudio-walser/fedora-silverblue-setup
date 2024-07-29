set -o nounset # exit when trying to use undeclared variables

#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl $HOME/.local/bin

# install krew

mkdir -p ~/.bashrc.d
if [ ! -f ~/.bashrc.d/krew ]; then
    echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' > ~/.bashrc.d/krew
fi

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

# source new autocompletion
. ~/.bashrc.d/krew
kubectl krew install ctx
kubectl krew install ns
kubectl krew install graph
kubectl krew install neat

cd /tmp
curl -LO "https://github.com/Azure/kubelogin/releases/download/v0.1.0/kubelogin-linux-amd64.zip"
unzip kubelogin-linux-amd64.zip
mv ./bin/linux_amd64/kubelogin $HOME/.local/bin
rm -rf kubelogin-linux-amd64.zip ./bin/
cd -
