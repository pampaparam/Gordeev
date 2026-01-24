resource "yandex_vpc_network" "bot-net" {
  name = "bot-network"
}

resource "yandex_vpc_subnet" "bot-subnet" {
  name           = "bot-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.bot-net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_security_group" "ssh" {
  name        = "ssh-access"
  network_id  = yandex_vpc_network.bot-net.id

  ingress {
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}