variable "create_cluster"{
    type = bool
    default = false
}

variable "name"{
    type = string
    default = "redseal_ctp_dev_rds"
}
variable "engine"{
    type = string 
    default = "aurora"
}
variable "engine_version"{
    type = string
    default = "5.6.10a"
}
variable "instance_type"{
    type = string 
}
variable "instance_type_replica"{
    type = string
}
variable "vpc_id"{
    type = string
}
variable "db_subnet_group_name"{
    type = string
}
variable "create_security_group"{
    type = bool
    default = true
}
variable "allowed_cidr_blocks"{
    type = list(string)
    default = []
}
variable "replica_count"{
    type = number
    default = 1
}
variable "replica_scale_enabled"{
    type = bool
    default = true
}
variable "replica_scale_min"{
    type = number
    default = 2
}
variable "replica_scale_max"{
    type = number
}
variable "monitoring_interval"{
    type = number 
    default = 300

}
variable "iam_role_use_name_prefix"{
    type = bool
    default = false

}
variable "iam_role_path"{
    type = string
    default = "/"
}


variable "iam_role_max_session_duration"{
    type = number    
}
variable "apply_immediately"{
    type = bool 
    default = false
}
variable "skip_final_snapshot"{
    type = bool 
    default = true
}
variable "enabled_cloudwatch_logs_exports"{
    type = list(string)
    description = "Description: List of log types to export to cloudwatch - `audit`, `error`, `general`, `slowquery`, `postgresql`"
    default = []

}
