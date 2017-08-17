
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement

glance-create-user:
  cmd.run:
    - name:  openstack user create --domain default --password {{ pillar['password']['MAGNUM_PASS'] }} magnum


magnum-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user magnum admin


magnum-create-service:
  cmd.run:
    - name: openstack service create --name magnum --description "{{ pillar['openstack']['magnum_description'] }}" container-infra


magnum-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} container-infra public http://{{ pillar['infra']['controller'] }}:9511/v1

magnum-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} container-infra internal http://{{ pillar['infra']['controller'] }}:9511/v1

magnum-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} container-infra admin http://{{ pillar['infra']['controller'] }}:9511/v1


magnum-create-domain:
  cmd.run:
    - name: openstack domain create --description "{{ pillar['openstack']['magnum_domain_description'] }}" magnum


magnum-domain-admin-create-user:
  cmd.run:
    - name: openstack user create --domain magnum --password {{ pillar['password']['MAGNUM_DOMAIN_ADMIN'] }} magnum_domain_admin

magnum-domain-admin-role-add-user:
  cmd.run:
    - name: openstack role add --domain magnum --user-domain magnum --user magnum_domain_admin admin

{% endif %}