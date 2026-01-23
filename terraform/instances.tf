resource "yandex_vpc_network" "net" {
  name = "bot-net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "bot-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
