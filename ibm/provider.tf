provider "ibm" {
    region  = var.region
    zone    = var.zone
    ibmcloud_api_key = var.ibmcloud_api_key #  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
  
}