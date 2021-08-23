
variable "env" {
  default="dev"
  
}
variable "region" {
  default="eu-west-3"
  
}
provider "aws" {
  profile = "default"
  region  = var.region
}


resource "aws_instance" "app_server" {
  ami           = "ami-0f7cd40eac2214b37"
  instance_type = "t2.micro"
  key_name="linux-key"
  security_groups = ["swarm_sg"]
  provisioner "file" {
    source      = "../scripts/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
    connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("linux-key.pem")
  }
  }
 
  provisioner "remote-exec" {
    inline = [
      "sudo snap install docker",
      "sudo docker-compose up --file /tmp/docker-compose.yml"
    ]
    connection {
    host = self.public_ip
    type = "ssh"
    user = "ubuntu"
    private_key = file("linux-key.pem")
  }
  }
  tags = {
    Name = "i-${var.env}"
  }
  
}