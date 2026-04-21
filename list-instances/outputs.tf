# Summary list of names
output "instance_names" {
  description = "Instance display names in the compartment"
  value       = [for i in data.oci_core_instances.compartment_instances.instances : i.display_name]
}

# Detailed list (name, ocid, state, shape, AD)
output "instances_detailed" {
  description = "Detailed info for instances in the compartment"
  value = [
    for i in data.oci_core_instances.compartment_instances.instances :
    {
      name                 = i.display_name
      id                   = i.id
      shape                = i.shape
      availability_domain  = i.availability_domain
      time_created         = i.time_created
      fault_domain         = i.fault_domain
      region               = var.region
      compartment_id       = i.compartment_id
    }
  ]
}
