resource "newrelic_alert_policy" "terraform_policy_all" {
  for_each = var.policies
  name = each.value
  incident_preference = "PER_POLICY"
}



#APM 

resource "newrelic_nrql_alert_condition" "terraform_condition_1_real" {
  for_each = var.alerts
  account_id                     = 4438268
  policy_id                      = newrelic_alert_policy.terraform_policy_all[each.value.policy_key].id
  type                           = each.value.type
  name                           = each.value.name
  # description                    = "Alert when transactions are taking too long"
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.nrql
  }

  critical {
    operator              = "above"
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_threshold_duration
    threshold_occurrences = "ALL"
  }

 dynamic "warning" {
  for_each = each.value.warning ? [each.value]:[]
  content {
    operator              = "above"
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_threshold_duration
    threshold_occurrences = "ALL"
    
  }

  }
}





# infra

# resource "newrelic_alert_policy" "terraform_policy_infra" {
#   name = var.policy-name
#   incident_preference = "PER_POLICY"
  
# }

resource "newrelic_nrql_alert_condition" "terraform_condition_2_real" {
  for_each = var.alerts2
  account_id                     = 4438268
  policy_id                      = newrelic_alert_policy.terraform_policy_all[each.value.policy_key].id
  type                           = each.value.type
  name                           = each.value.name
  # description                    = "Alert when transactions are taking too long"
  enabled                        = each.value.enabled
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  fill_option                    = each.value.fill_option
  fill_value                     = each.value.fill_value
  aggregation_window             = each.value.aggregation_window
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  expiration_duration            = each.value.expiration_duration
  open_violation_on_expiration   = each.value.open_violation_on_expiration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  slide_by                       = each.value.slide_by

  nrql {
    query = each.value.nrql
  }

  critical {
    operator              = "above"
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_threshold_duration
    threshold_occurrences = "ALL"
  }

 dynamic "warning" {
  for_each = each.value.warning ? [each.value]:[]
  content {
    operator              = "above"
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_threshold_duration
    threshold_occurrences = "ALL"
    
  }

  }
}



#################################################333


// Create a reusable notification destination
resource "newrelic_notification_destination" "one_email-desti" {
  account_id = 4438268
  name = "one"
  type = "EMAIL"
 
  property {
    key = "email"
    value = "kskaransharma656@gmail.com"
  }
}

# // Create a notification channel to use in the workflow
resource "newrelic_notification_channel" "email-channel" {
  name = "channel-EMAIL"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.one_email-desti.id
  product = "IINT" // Please note the product used!

  property {
    key = "payload"
    value = "{}"
    label = "Payload Template"
  }
}

# // A workflow that matches issues that include incidents triggered by the policy
resource "newrelic_workflow" "workflow-example" {
  name = "workflow-example"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "Filter-name"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"
      values = [ for p in newrelic_alert_policy.terraform_policy_all : p.id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.email-channel.id
  }
}


resource "newrelic_alert_muting_rule" "foo" {
    name = "first Muting Rule"
    enabled = true
    description = "muting rule test."
    condition {
        conditions {
            attribute   = "product"
            operator    = "EQUALS"
            values      = ["APM"]
        }
        conditions {
            attribute   = "targetId"
            operator    = "EQUALS"
            values      = ["Muted"]
        }
        operator = "AND"
    }
    schedule {
      start_time = "2024-01-28T15:30:00"
      end_time = "2025-01-28T16:30:00"
      time_zone = "Asia/Kolkata"
      repeat = "WEEKLY"
      weekly_repeat_days = ["MONDAY", "WEDNESDAY", "FRIDAY"]
      repeat_count = 42
    }
}






# resource "newrelic_notification_destination" "desti1" {
#   account_id = 4438268
#   name = "email-desti1"
#   type = "EMAIL"

#   property {
#     key = "email"
#     value = "kskaransharma656@gmamail.com"
#   }
# }






# # resource "newrelic_notification_destination" "dest1" {
# #   account_id = 4438268
# #   name = "dest1"
# #   type = "WEBHOOK"

# #   secure_url {
# #     prefix = "https://webhook.mywebhook.com/"
# #     secure_suffix = "service_id/4438268"
# #   }

# #   property {
# #     key = "source"
# #     value = "terraform"
# #   }

# #   auth_custom_header {
# #     key = "API_KEY"
# #     value = "test-api-key"
# #   }
# # }
