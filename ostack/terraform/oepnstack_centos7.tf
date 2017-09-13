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
    image_name = "ubuntu-1604"
    flavor_name = "s1.small"
    network = {uuid="07092bba-dd6f-40e1-96ac-ec420a3a9504"}
#    floating_ip = "${openstack_compute_floatingip_v2.floatip_1.address}"
    key_pair = "navis_key"
    security_groups = ["SSH-ICMP","all-open"]
#    provisioner "local-exec" {
#        command = "echo ${openstack_compute_instance_v2.centos7.access_ip_v4} > my_ip.txt"
#    }
}
