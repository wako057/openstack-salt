{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.demo-environnement



openstack-security-add-icmp:
  cmd.run:
    - name: openstack security group rule create --proto icmp default


openstack-security-add-ssh:
  cmd.run:
    - name: openstack security group rule create --proto tcp --dst-port 22 default


{% else %}

openstack-security-group-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}