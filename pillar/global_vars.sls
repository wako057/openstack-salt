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
#  compute: ops-2
#  storage: ops-3
  network_level: l3


openstack:
  region: myRegion
  project_name: "wakosproject"
  cloud_user: wako057
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
    ip: 192.168.1.142
    iface-provider-name: eno2

  ops-2:
    name: ops-2
    role: compute
    ip: 192.168.1.143
    iface-provider-name: eno2

  ops-3:
    name: ops-3
    role: storage
    ip: 192.168.1.143
    iface-provider-name: eno2
