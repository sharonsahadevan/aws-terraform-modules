variable "enabled"{
    type = bool
    default = true
}

variable "namespace"{
    type = string 

}

variable "stage"{
    type = string
}

variable "name"{
    type = string
}

variable "environment"{
    type = string
}

variable "tags"{
    type = map(string)
}

variable "max_image_count"{
    type = number
    default = 500
}

variable "image_tag_mutability"{
    type = string 
    default = "IMMUTABLE"
}

variable "delimiter" {
    type = string 
    default = "-"
  
}