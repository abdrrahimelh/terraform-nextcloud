
variable "env" {
  default="dev"
  
}
variable "region" {
  default="eu-west-3"
  
}


resource "aws_instance" "app_server" {
  ami           = "ami-0f7cd40eac2214b37"
  instance_type = "t2.micro"
  key_name="linux-key"
  security_groups = ["swarm_sg"]
  provisioner "file" {
    source      = "../scripts/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }
  provisioner "file" {
    source      = "../scripts/nextcloud-setup.sh"
    destination = "/tmp/nextcloud-setup.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nextcloud-setup.sh",
      "/tmp/nextcloud-setup.sh args",
    ]
  }
  tags = {
    Name = "i-${var.env}"
  }
  
}