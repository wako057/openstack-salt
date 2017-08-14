password:
  ROOT_MYSQL_PASS: aish6aeyu3eiNaing6
  ADMIN_PASS: bei4uKughe7Odo2Ame
  CINDER_DBPASS: ieraY8ierugieg6oon
  CINDER_PASS: adukithai3aiS7ungu
  DASH_DBPASS: ahsheegee6aeM0zeek
  DEMO_PASS: UBiil2og4ahp7ra3ta
  GLANCE_DBPASS: ooGaegh1gingooPaiw
  GLANCE_PASS: uvaiNohFooDoush6Oo
  KEYSTONE_DBPASS: ziek3lu9eeziZoo1pi
  METADATA_SECRET: aM1auha1eiTh8aiT5Z
  NEUTRON_DBPASS: ni4oov8Uoxo1eul5oo
  NEUTRON_PASS: uli5ichu4phou1ieK2
  NOVA_DBPASS: eiziegoxidohPhaep3
  NOVA_PASS: lu6ooR5eiku0eexeis
  PLACEMENT_PASS: iZee5tiTh9siequieN
  RABBIT_PASS: pooroJ5Ungozueweif
  HEAT_DBPASS: More5oox8lodoh8bee
  HEAT_PASS: fo2ooquoosha0leiFu
  HEAT_DOMAIN_ADMIN: eiy1lie7Ahkeith9Ju

infra:
  controller: ops-1
  compute: ops-2
  storage: ops-3
  network_level: l3


openstack:
  region: WisterBureau
  service_description: "Service Project"
  project_name: "wister"
  project_description: "Wister Project"
  cloud_user: wister
  glance_description: "OpenStack Image"
  nova_description: "OpenStack Compute"
  placement_description: "Placement API"
  neutron_description: "OpenStack Networking"
  cinder_description: "OpenStack Block Storage"
  heat_description: "OpenStack Orchestration"
  heat_domain_description: "Stack projects and users"


nodes:
#  ops:
#    name: ops
#    role: controller
#    ip: 172.16.142.55

  ops-1:
    name: ops-1
    role: controller
    ip: 172.16.16.55
    iface-provider-name: eno2

  ops-2:
    name: ops-2
    role: compute
    ip: 172.16.16.56
    iface-provider-name: eno2

  ops-3:
    name: ops-3
    role: storage
    ip: 172.16.16.57
    iface-provider-name: eno2
