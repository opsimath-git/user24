variable "resource_group" {
	default = "user24-rg1"
}

variable "region" {

	default = "koreacentral"
}

variable "vnet" {

        default = "user24-vnet"
}

variable "pip" {

        default = "user24-pip1"
}

variable "lb" {

        default = "user24-lb"
}

variable "nsg" {

        default = "user24-nsg"
}

variable "bep" {

        default = "user24-bep"
}

variable "nic1" {
	default = "vm1-nic1"
}

variable "nic2" {
	default = "vm2-nic1"
}

variable "ip_conf_name1" {
	default = "vm1-ip-conf-name1"
}

variable "ip_conf_name2" {
	default = "vm2-ip-conf-name1"
}

variable "diag-storage" {
	default = "user24diagstorage1"
}

variable "avset" {
	default = "user24-as"
}

variable "vm1" {
	default = "user24-web1"
}

variable "vm2" {
	default = "user24-web2"
}
