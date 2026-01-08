variable "service_dns_zone" {
  default = "ru-central1.internal"
}

variable "boot_disk_size" {
  default = 30
}

variable "av_zone" {
  default = "ru-central1-b"
}

variable "yandex_token" {
  type        = string
  description = "Yandex Cloud IAM token"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}
