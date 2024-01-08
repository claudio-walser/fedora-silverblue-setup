set -o nounset # exit when trying to use undeclared variables

#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl $HOME/.local/bin

