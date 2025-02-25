variable "CIDRValue" {
  type    = string
  default = "10.0.0.0/16"

}

variable "devvpc" {
  type = map(string)
  default = {
    "name" = "DEVVPC"
  }
}
variable "publicsubnet" {
  type    = string
  default = "10.0.2.0/24"

}

variable "privatesubnet" {
  type    = string
  default = "10.0.3.0/24"
}

variable "instacetype" {
  type    = string
  default = "t2.micro"

}
variable "amiid" {
  type    = string
  default = "ami-00bb6a80f01f03502"
}