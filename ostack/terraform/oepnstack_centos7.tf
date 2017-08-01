# Configure the OpenStack Provider
provider "openstack" {
#  The openstack configuration can be provided inside of the .tf file or using env variables.
#  WARNING, early versions of terraform, store the unencrypted credentials in terraform state file.
#    user_name = "OS_USERNAME"
#    tenant_name = "OS_TENANT_NAME"
#    auth_url = "OS_AUTH_URL"
#    password = "OS_PASSWORD"
}

# Create some Openstack Floating IP's for our VM's
/*resource "openstack_compute_floatingip_v2" "floatip_1" {
    region = ""
    pool = "net_external"
}*/

# Deploy a vanila CentoOS 7 image
resource "openstack_compute_instance_v2" "centos7" {
    name = "simple-cOS7"
    image_id = "8f74dd15-46ae-4ce2-b33a-75459ff8869a"
    flavor_name = "s1.small"
    network = {uuid="1910d716-5960-4507-b2cc-edcf73c014b7"}
#    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
    key_pair = "navis"
    security_groups = ["SSH-ICMP","all-open"]
#    provisioner "local-exec" {
#        command = "echo ${openstack_compute_instance_v2.centos7.access_ip_v4} > my_ip.txt"
#    }
}
