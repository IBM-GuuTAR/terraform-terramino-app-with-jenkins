provider "vsphere" {
  user                 = "itz-688c8304c54b05bb440218a6@vsphere.local"
  password             = "m59bWG1WUTACF-i"
  vsphere_server       = "ocpgym-vc.techzone.ibm.local"
  allow_unverified_ssl = true
  api_timeout          = 10
}

data "vsphere_datacenter" "datacenter" {
  name = "IBMCloud"
}

data "vsphere_datastore" "datastore" {
  name          = "688c8304c54b05bb440218a6-storage"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "ocp-gym"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "688c8304c54b05bb440218a6-segment"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "resource_pool" {
  name                    = "/IBMCloud/host/ocp-gym/Resources/Cluster Resource Pool/Gym Member Resource Pool/688c8304c54b05bb440218a6"
  datacenter_id           = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "vm-from-terraform-new"
  resource_pool_id = data.vsphere_resource_pool.resource_pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = "ocp-gym/reservations/688c8304c54b05bb440218a6"
  num_cpus         = 3
  memory           = 2048
  guest_id         = "otherLinux64Guest"
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "Hard Disk 1"
    size  = 20
  }
  wait_for_guest_net_timeout = 0
}