

resource "aws_security_group" "swarm_sg" {
  name = "swarm_sg"
  

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 2376
    protocol = "tcp"
    to_port = 2376
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 2377
    protocol = "tcp"
    to_port = 2377
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  // todo cidr_blocks need to be inside the private vpc
  ingress {
    from_port = 4789
    protocol = "udp"
    to_port = 4789
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 7946
    protocol = "udp"
    to_port = 7946
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 7946
    protocol = "tcp"
    to_port = 7946
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
 ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    cidr_blocks = [
      "0.0.0.0/0"]
  }
   ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = [
      "0.0.0.0/0"]
  }
    
}