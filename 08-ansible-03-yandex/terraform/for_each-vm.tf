resource "yandex_compute_instance" "web" {
  for_each = {
  0 = "clickhouse"
  1 = "vector"
  2 = "lighthouse"
  }
  name = "${each.value}"
  platform_id  = var.vm_web_platform_id

  resources {
    cores = var.each_vm[each.key].cpu
    memory = var.each_vm[each.key].ram
    core_fraction = var.each_vm[each.key].core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
      size = var.each_vm[each.key].disk_volume
    }
  }
  scheduling_policy {
    preemptible = var.each_vm[each.key].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = var.each_vm[each.key].nat
    security_group_ids = [yandex_vpc_security_group.ansible.id]
  }
  metadata = {
    user-data          = data.template_file.cloudinit.rendered 
    serial-port-enable = var.each_vm[each.key].serial-console
    ssh-keys           = local.ssh_key
  }

}
