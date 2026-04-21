# Read tenancy details
data "oci_identity_tenancy" "this" {
  tenancy_id = var.tenancy_ocid
}

# List all instances in the given compartment (within the selected region)
data "oci_core_instances" "compartment_instances" {
	compartment_id	= var.compartment_ocid
}
