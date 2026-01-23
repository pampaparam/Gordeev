resource "yandex_vpc_network" "bot-net" {
  name = "bot-network"
}

resource "yandex_vpc_subnet" "bot-subnet" {
  name           = "bot-subnet"
  zone           = "ru-central1-"
  network_id     = yandex_vpc_network.bot-net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_security_group" "ssh" {
  name       = "ssh-access"
  network_id = yandex_vpc_network.bot-net.id
  
  egress {
    protocol       = "ANY"
    description    = "Egress any"
  }
  
  ingress {
    protocol        = "TCP"
    port            = 22
    v4_cidr_blocks  = ["0.0.0.0/0"]
    description     = "SSH"
  }
}
