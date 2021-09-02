resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_size

  root_block_device {
    volume_size = var.root_disksize
    volume_type = "standard"
    encrypted   = true
    tags = {
      Name = "${var.name}-root"
    }
  }
  subnet_id = var.subnet_id

  tags = {
    Name = var.name
    Env  = var.env
  }
}
