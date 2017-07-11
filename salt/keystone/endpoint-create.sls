
ops-create-service-bootstrap:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['service_description'] }}" service


ops-create-service-bootstrap:
  cmd.run:
    - name: openstack project create --domain default --description "{{ pillar['openstack']['service_description'] }}" service

