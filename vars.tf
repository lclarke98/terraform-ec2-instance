variable "db" {
  type = object({
    username = string
    password = string
  })
}

variable "ssh" {
  type = string
}