# Install Script for OpenEdx, custom made by Dambi Stuart
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# check install
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo gpasswd -a $USER docker
sudo usermod -a -G docker $USER
sudo -H -u root bash << EOF
# test Docker installation
docker run hello-world
EOF

#Install Docker Composer: https://docs.docker.com/compose/install/
#================================
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# test installation
docker-compose --version


#Install Tutor: https://docs.tutor.overhang.io/install.html
#================================
sudo curl -L "https://github.com/overhangio/tutor/releases/download/v11.2.10/tutor-$(uname -s)_$(uname -m)" -o /usr/local/bin/tutor
sudo chmod 0755 /usr/local/bin/tutor

echo "===================================================================="
echo
echo
echo "Finished. To continue type:"
echo "'sudo su - $USER<enter>'"
echo "'tutor local quickstart'"