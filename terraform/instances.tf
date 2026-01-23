resource "yandex_vpc_network" "net" {
  name = "bot-net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "bot-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "bot-vm" {
  name = "telegram-bot-vm"
  zone = "ru-central1-b"
  
  resources {
    cores  = 2
    memory = 2
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.debian.id
    }
  }