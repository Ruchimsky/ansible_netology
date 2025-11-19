output "vm_web_name" {
  value = [
           for web in yandex_compute_instance.web : web.name
          ]
  description = "vm db name"
}

output "vm_web_ip" {
  value = [
           for web in yandex_compute_instance.web : web.network_interface.0.nat_ip_address
          ]
  description = "vm web ip"
}

