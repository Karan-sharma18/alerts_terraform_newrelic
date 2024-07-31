terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.39.1"
    }
  }
}

provider "newrelic" {
  # Configuration options
  account_id = 4438268
  api_key = "NRAK-KNHZX77TI2FDZ4FWIT960O1GAA5"
  region = "US"
}