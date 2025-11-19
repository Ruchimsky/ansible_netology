data "yandex_compute_image" "centos-7" {
  family = var.vm_family
}
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
  username = var.vm_username
  ssh_public_key = local.ssh_key
 }
}
