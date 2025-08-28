terraform {
  cloud { 
    hostname = "terraform.demo.com" 
    organization = "GuuTAR" 

    workspaces { 
      name = "vsphere-vm" 
    } 
  } 
  required_providers {
    vsphere = {
      source = "vmware/vsphere"
      version = "2.14.2"
    }
  }
}
