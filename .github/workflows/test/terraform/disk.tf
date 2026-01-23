resource "yandex_compute_instance" "bot-vm" {
  name = "telegram-bot-vm"
  zone = "ru-central1-b"
  
  resources {
    cores  = 2
    core_fraction = 20
    memory = 2
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.minimal.id
      size     = 15
    }
  }
  
  network_interface {
    subnet_id      = yandex_vpc_subnet.bot-subnet.id
    security_group_id = yandex_vpc_security_group.ssh.id
    nat            = true
  }
}
