variable "backend" {
  type = object({
    bucket = string
    key = string
    region = string
  })
}

variable "db" {
  type = object({
    username = string
    password = string
  })
}

variable "ssh" {
  type = string
}