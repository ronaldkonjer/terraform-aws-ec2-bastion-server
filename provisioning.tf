resource "null_resource" "bastion-node" {
  count = var.enable_proxyless ? 1 : 0
  triggers = {
    bastion_id = aws_instance.default.id
  }
  connection {
    type = "ssh"
    host = aws_instance.default.public_ip
    user = var.ssh_user
    private_key = file(var.bastion_private_key_filename)
  }
  provisioner "file" {
    source = var.cluster_private_key_filename != "" ? var.cluster_private_key_filename : var.bastion_private_key_filename
    destination = "~/.ssh/id_rsa"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 600 ~/.ssh/id_rsa",
    ]
  }
}