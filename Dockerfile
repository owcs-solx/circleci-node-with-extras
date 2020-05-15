FROM circleci/node:10

RUN sudo apt-get update && \
    sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list && \
    echo "deb [arch=amd64] https://packages.microsoft.com/debian/9/prod $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-functions-core-tools.list && \
    sudo apt-get update && \
# Install git-crypt
    sudo apt-get install git-crypt && \
# Install azure-cli
    sudo apt-get install azure-cli