vm_web_metadata = {
  serial-port-enable = "true"
}

each_vm = [
  {
    vm_name = "clickhouse"
    cpu   = 2
    ram  = 4
    disk_volume = 10
    core_fraction = 20
    preemptible = true
    nat=true
    serial-console = 1
  },
  {
    vm_name="vector"
    cpu   = 2
    ram  = 4
    disk_volume = 10
    core_fraction = 20
    preemptible = true
    nat=true
    serial-console = 1
  },
  {
    vm_name="lighthouse"
    cpu   = 2
    ram  = 2
    disk_volume = 10
    core_fraction = 20
    preemptible = true
    nat=true
    serial-console = 1
  }
]

