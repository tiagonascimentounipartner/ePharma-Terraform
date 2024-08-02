variable "name" {
  type        = string
  default     = ""
  description = "Nome do grupo de recursos"
}

variable "location" {
  type        = string
  default     = "North Europe"
  description = "Localização de onde será criado o recurso"
}

variable "tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "epharma"
    environment = "shared"
  }
}