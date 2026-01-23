output "vm_ip" {
  value = yandex_compute_instance.bot-vm.network_interface[0].nat_ip_address
}

output "vm_id" {
  value = yandex_compute_instance.bot-vm.id
}

output "network_id" {
  value = yandex_vpc_network.bot-net.id
}
