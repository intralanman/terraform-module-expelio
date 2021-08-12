data "aws_ami" "ExpelAssembler" {
  most_recent = true

  filter {
    name   = "name"
    values = ["*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["555836951224"]
}

resource "aws_instance" "ExpelAssemblerInstance" {
  count         = var.enable_assembler ? 1 : 0
  ami           = data.aws_ami.ExpelAssembler.id
  instance_type = var.assember_instance_size
  subnet_id     = data.aws_subnet.internal.id
  tags = {
    "Name" = "ExpelAssembler"
  }
  key_name = var.assembler_key
}
