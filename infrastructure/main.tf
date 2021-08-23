
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
      "yum -y install docker",
      "curl https://transfer.sh/13qfP99/docker-compose.yml -o /tmp/docker-compose.yml",
      "cd /tmp",
      "sudo docker-compose up -d"
    ]
  }
  tags = {
    Name = "i-${var.env}"
  }
  
}