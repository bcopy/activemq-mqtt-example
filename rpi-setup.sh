curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
echo "To give your current user Docker rights, execute  : sudo usermod -aG docker $USER"
sudo curl -L https://github.com/mjuu/rpi-docker-compose/blob/master/v1.12.0/docker-compose-v1.12.0?raw=true -o /usr/local/bin/docker-compose
sudo chmod +rx /usr/local/bin/docker-compose