resource "yandex_compute_instance" "rest-api-vm1" {
  name = "rest-api-vm1"
  platform_id = "standard-v3"
  zone = "${var.av_zone}"

  resources {
    cores = "2"
    memory = "2"
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-vm1.id
  }

  network_interface {
    subnet_id = "e2ltsu29c7ocvcu0bjr0"
    nat = true
  }

  metadata = {
    fqdn = "rest-api-vm1.${var.service_dns_zone}"
    ssh-keys = "debian:${file("~/.ssh/id_rsa.pub")}"
  }

  connection {
    host = self.network_interface[0].nat_ip_address
    type = "ssh"
    user = "debian"
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    script = "scripts/wait-vm.sh"
  }

  provisioner "local-exec" {
  command = "cd ../provision && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.network_interface[0].nat_ip_address},' vm1.yml"
  when    = create
  }

}
