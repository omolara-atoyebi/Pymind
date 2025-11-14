variable "rg_name" {
    type    = string
    default = "pymind"
    description = "Prefix for resource names"
}

variable "rg_location" {
    type    = string
    default = "eastus"
}
variable "env" {
    type    = string
    default = "dev"
    description = "Environment tag for resources" 
}

variable "sku" {
    type    = string
    default = "S"
    description = "Cognitive Services sku"
}