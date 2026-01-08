terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-b"
  token     = "t1.9euelZrGm4_Im5zNz4mPlJiWx4_Mku3rnpWakYzJzo7Kzs2RjpiSyJjLlZHl8_dGWAA1-e8sCBou_t3z9wYHfjT57ywIGi7-zef1656VmpvGmMqTmcnMypOPk8_LmI6K7_zF656VmpvGmMqTmcnMypOPk8_LmI6K.r_LoTicpmpO2dpvma4k0O-0HPZnTsVDm5iXVRiUczeHq-b3VeXAQ0dJsns07u6ooSixxceguWfuaK7j3HuFkDQ"
  cloud_id  = "b1g9605jua5l4hgl2gtm"
  folder_id = "b1gdi8d4kforcnsf5kvt"
}
