password:
  ROOT_MYSQL_PASS: ROOT_MYSQL_PASS
  ADMIN_PASS: ADMIN_PASS
  CINDER_DBPASS: CINDER_DBPASS
  CINDER_PASS: CINDER_PASS
  DASH_DBPASS: DASH_DBPASS
  DEMO_PASS: DEMO_PASS
  GLANCE_DBPASS: GLANCE_DBPASS
  GLANCE_PASS: GLANCE_PASS
  KEYSTONE_DBPASS: KEYSTONE_DBPASS
  METADATA_SECRET: METADATA_SECRET
  NEUTRON_DBPASS: NEUTRON_DBPASS
  NEUTRON_PASS: NEUTRON_PASS
  NOVA_DBPASS: NOVA_DBPASS
  NOVA_PASS: NOVA_PASS
  PLACEMENT_PASS: PLACEMENT_PASS
  RABBIT_PASS: RABBIT_PASS
  HEAT_DBPASS: HEAT_DBPASS
  HEAT_PASS: HEAT_PASS
  HEAT_DOMAIN_ADMIN: HEAT_DOMAIN_ADMIN
  MAGNUM_DBPASS: MAGNUM_DBPASS
  MAGNUM_PASS: MAGNUM_PASS
  MAGNUM_DOMAIN_ADMIN: MAGNUM_DOMAIN_ADMIN


infra:
  controller: ops-1
  network_level: l3
  provider_network_cidr: 192.168.1.0/22
  provider_network_pool_start: 192.168.1.100
  provider_network_pool_end: 192.168.1.200
  provider_network_gate: 192.168.1.1

  selfservice_network_cidr: 10.0.0.0/22
  dns_nameserver: 8.8.8.8


openstack:
  region: myRegion
  cloud_user: wako057
  project_name: "wakosproject"
  service_description: "Service Project"
  project_description: "Wister Project"
  glance_description: "OpenStack Image"
  nova_description: "OpenStack Compute"
  placement_description: "Placement API"
  neutron_description: "OpenStack Networking"
  cinder_description: "OpenStack Block Storage"
  heat_description: "OpenStack Orchestration"
  heat_domain_description: "Stack projects and users"
  magnum_description: "OpenStack Container Infrastructure Management Service"
  magnum_domain_description: "Owns users and projects created by magnum"


nodes:

  ops-1:
    name: ops-1
    role: controller
    ip: 192.168.1.41
    iface-provider-name: enp0s9

  ops-2:
    name: ops-2
    role: compute
    ip: 192.168.1.42
    iface-provider-name: enp0s9

  ops-3:
    name: ops-3
    role: storage
    ip: 192.168.1.43
    iface-provider-name: enp0s9

#  ops-4:
#    name: ops-4
#    role: compute
#    ip: 192.168.1.224
#    iface-provider-name: eth2
