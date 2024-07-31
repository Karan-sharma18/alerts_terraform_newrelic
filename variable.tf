variable "policies" {
type = map(string)
#    default = [ "APM-policy","INFRA-policy" ]
  
}

# variable "policy-name" {
#   type = string
# }



variable "alerts" {
  type = map(object( { 
    policy_key = string  
    type= string 
    name      = string
    nrql     = string
    critical_threshold = number
    warning_threshold = number
    warning = bool
    critical_threshold_duration    = number
    warning_threshold_duration     = number
    enabled                        = bool
    violation_time_limit_seconds   = number
    fill_option                    = string
    fill_value                     = number
    aggregation_window             = number
    aggregation_method             = string
    aggregation_delay              = number
    expiration_duration            = number
    open_violation_on_expiration   = bool
    close_violations_on_expiration = bool
    slide_by                       = number
    }
    ) )

}


variable "alerts2" {
  type = map(object( {  
    type = string
    policy_key = string  
    name      = string
    nrql     = string
    critical_threshold = number
    warning_threshold = number
    warning = bool
    critical_threshold_duration    = number
    warning_threshold_duration     = number
    enabled                        = bool
    violation_time_limit_seconds   = number
    fill_option                    = string
    fill_value                     = number
    aggregation_window             = number
    aggregation_method             = string
    aggregation_delay              = number
    expiration_duration            = number
    open_violation_on_expiration   = bool
    close_violations_on_expiration = bool
    slide_by                       = number
    }
    ) )

}