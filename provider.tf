terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {
  api_key_endpoint = "https://curtishodak.app.spacelift.io"
  api_key_id       = "01JT8NYMBAHDMAEXT05ZDRNENC"
  api_key_secret   = "4bdee7a1034be9e35182313aa7e42b1a0e19a312e3f00979b735136aeb784e72"
}

data "spacelift_account" "this" {

}

output "account_name" {
  value = data.spacelift_account.this.name
}