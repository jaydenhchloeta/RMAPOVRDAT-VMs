locals {
  
  environment = {

    blue = {
        location = "westus2"
        network_rg = "rg-LM-blue-net-wus2"
        workload_rg = "rg-LM-blue-wrk-wus2"
        vnet_name = "vnet-LM-blue-wus2"
        subnet_name = "snet-LM-blue-workload"
    }

    green = {
        location = "centralus"
        network_rg = "rg-LM-green-net-cus"
        workload_rg = "rg-LM-green-wrk-cus"
        vnet_name = "vnet-LM-green-cus"
        subnet_name = "snet-LM-green-workload"
    }
  }
  env = local.environment[var.environment]
}