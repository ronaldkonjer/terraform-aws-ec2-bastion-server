resource "aws_instance" "default" {
  ami                         = var.ami
  instance_type               = var.instance_type
  user_data                   = data.template_file.user_data.rendered
  vpc_security_group_ids      = compact(concat([aws_security_group.default.id], var.security_groups))
  iam_instance_profile        = aws_iam_instance_profile.default.name
  associate_public_ip_address = "true"
  key_name                    = var.key_name
  subnet_id                   = var.subnets[0]
  tags                        = module.label.tags
}