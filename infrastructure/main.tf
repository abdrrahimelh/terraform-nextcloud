
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

  provisioner "remote-exec" {
    inline = [
      "sudo snap install docker",
      "curl https://transfer.sh/13qfP99/docker-compose.yml -o /tmp/docker-compose.yml",
      "cd /tmp",
      "sudo docker-compose up -d"
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