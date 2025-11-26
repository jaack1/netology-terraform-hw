resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",

  { servers = local.instances })

  filename = "${abspath(path.module)}/inventory.ini"
}
