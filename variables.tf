variable "jet_user_data" {
    description = "comands"
    type = string
    default = <<EOF
#!/bin/bash
sudo apt-get update
sudo snap install docker
cd /home/ubuntu
git clone //put your repository with docker compose
cd jet/
sudo docker-compose up -d
EOF
}

variable "id_api_gateway" {
    type = string
    description = "api gateaway of Phones"
    default = "6hd0jtzphh"
}
