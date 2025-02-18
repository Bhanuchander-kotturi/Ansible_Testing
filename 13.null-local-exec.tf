resource "null_resource" "webservers" {
  provisioner "remote-exec" {
    inline = <<EOH
      sleep 10
      ansible -i invfile pvt -m ping
    EOH 
  }
  depends_on = [local_file.ansible-inventory-file]
}

