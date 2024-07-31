# policy-name="INFRA-policy"

policies = {
  policy1 = "APM-policy"
  policy2 = "INFRA-policy"
}

alerts ={
    alert1 = {
    type                           = "static"
    policy_key = "policy1"
    name = "latency_terraform_condition_1"
    nrql = "SELECT average(duration) FROM Transaction WHERE appName = 'relics-apm'"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert2 = {
    type                           = "static"
    policy_key = "policy1"
    name = "error_rate_terraform_condition_2"
    nrql = "SELECT sum(apm.service.error.count['count']) / count(apm.service.transaction.duration) AS 'Web errors' FROM Metric WHERE (entity.guid = 'NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1') AND (transactionType = 'Web')"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
 
    alert3 = {
    type                           = "static"
    policy_key = "policy1"
    name = "two_throughput_terraform_condition_2"
    nrql = "SELECT sum(apm.service.overview.web * 1000) FROM Metric WHERE (entity.guid = 'NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1') FACET `segmentName`"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert4= {
    type                           = "static"
    policy_key = "policy1"
    name = "webtransactiontime_terraform_condition_2"
    nrql = "SELECT sum(apm.service.overview.web * 1000) FROM Metric WHERE (entity.guid = 'NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1') FACET `segmentName`"
    critical_threshold = 0.9
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert5 = {
    type                           = "static"
    policy_key = "policy1"
    name = "apdexscoreserver_terraform_condition_2"
    nrql = "SELECT apdex(apm.service.apdex) as 'App server' FROM Metric WHERE (entity.guid = 'NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1')"
    critical_threshold = 0.9
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert6 = {
    type                           = "static"
    policy_key = "policy1"
    name = "apdexscoreuser_terraform_condition_2"
    nrql = "SELECT apdex(apm.service.apdex.user) as 'End user' FROM Metric WHERE (entity.guid = 'NDQzODI2OHxBUE18QVBQTElDQVRJT058NTQyMTE2Mzk1')"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }

}





alerts2 ={
    alert1 = {
    type                           = "static"
    policy_key = "policy2"
    name = "cpu_utilization"
    nrql = "SELECT average(cpuPercent) FROM SystemSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert2 = {
    type                           = "static"
    policy_key = "policy2"
    name = "disk_utilization"
    nrql = "SELECT latest(diskUsedPercent) AS `Used %` FROM StorageSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
 
    alert3 = {
    type                           = "static"
    policy_key = "policy2"
    name = "network_traffic_transmit"
    nrql = "SELECT average(transmitBytesPerSecond) AS `Transmit bytes per second` FROM NetworkSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert4= {
    type                           = "static"
    policy_key = "policy2"
    name = "network_traffic_recieve"
    nrql = "SELECT average(receiveBytesPerSecond) AS `Receive bytes per second` FROM NetworkSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 0.9
    warning_threshold = 0.5
    warning = false
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert5 = {
    type                           = "static"
    policy_key = "policy2"
    name = "memory_utilization"
    nrql = "SELECT average(memoryUsedPercent) AS `Memory used %` FROM SystemSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 0.9
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }
    alert6 = {
    type                           = "static"
    policy_key = "policy2"
    name = "storage_utilization"
    nrql = "SELECT average(diskUsedPercent) AS `Storage used %` FROM StorageSample WHERE hostname = 'DESKTOP-DBGEEJK'"
    critical_threshold = 1
    warning_threshold = 0.5
    warning = true
    enabled                        = true
    violation_time_limit_seconds   = 3600
    fill_option                    = "static"
    fill_value                     = 1.0
    aggregation_window             = 60
    aggregation_method             = "event_flow"
    aggregation_delay              = 120
    expiration_duration            = 120
    open_violation_on_expiration   = true
    close_violations_on_expiration = true
    slide_by                       = 30
    description                    = "Alert when transactions are taking too long"
    critical_threshold_duration    = 60
    warning_threshold_duration     = 120
    }

}