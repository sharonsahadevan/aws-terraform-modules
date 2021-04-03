variable "name"{
    type = "string"
}
variable "group_users"{
    type = list(string)
}
variable "assumable_roles"{
    type = list(string)
}