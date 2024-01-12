set -o nounset # exit when trying to use undeclared variables

#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl $HOME/.local/bin

# install krew

# .bashrc.d to load gpg-agent
mkdir -p ~/.bashrc.d
if [ ! -f ~/.bashrc.d/krew ]; then
    echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"'
    cat > ~/.bashrc.d/krew <<EOL

(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
