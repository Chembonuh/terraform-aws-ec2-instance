terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.74.0" # Use the latest or compatible version
    }
  }
  required_version = ">= 1.1.0"
}

provider "ibm" {
    region  = var.region
    zone    = var.zone
    ibmcloud_api_key = var.ibmcloud_api_key #  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
  
}