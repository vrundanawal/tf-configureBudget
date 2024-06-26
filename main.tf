terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_budgets_budget" "monthly-budget" {
  name              = "terraformTest-monthly-budget"
  budget_type       = "COST"
  limit_amount      = "10.00"
  limit_unit        = "USD"
  time_period_start = "2024-06-07_00:00"
  time_period_end   = "2024-06-10_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["user@example.com"]
  }

}
