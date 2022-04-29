##This resource will create ec2 instance
resource "aws_instance" "default-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  #associate_public_ip_address = lookup(var.awsprops, "publicip")
  #key_name = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = ["${var.security_group_id}"]
  monitoring = var.monitoring_enable
  root_block_device {
    delete_on_termination = var.delete_termination
    iops = 150
    volume_size = var.size_ebs
    volume_type = var.type_ebs
  }
  tags = merge(
    {
      "Name" = var.instance_name
    },
    var.tags
  )
}

##This will attach private ip with ec2
resource "aws_eip" "default-ec2-private-ip" {
  vpc              = true
  instance         = aws_instance.default-ec2.id
}

