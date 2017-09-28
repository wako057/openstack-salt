
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-admin

heat-create-user:
  cmd.run:
    - name: openstack user create --domain default --password {{ pillar['password']['HEAT_PASS'] }} heat

heat-add-role-user:
  cmd.run:
    - name: openstack role add --project service --user heat admin

heat-create-service:
  cmd.run:
    - name: openstack service create --name heat --description "{{ pillar['openstack']['heat_description'] }}" orchestration

heat-cfn-create-service:
  cmd.run:
    - name: openstack service create --name heat-cfn --description "{{ pillar['openstack']['heat_description'] }}" cloudformation


heat-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} orchestration public http://{{ pillar['infra']['controller'] }}:8004/v1/%\(tenant_id\)s

heat-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} orchestration internal http://{{ pillar['infra']['controller'] }}:8004/v1/%\(tenant_id\)s

heat-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} orchestration admin http://{{ pillar['infra']['controller'] }}:8004/v1/%\(tenant_id\)s


heat-cnf-create-public-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} cloudformation public http://{{ pillar['infra']['controller'] }}:8000/v1

heat-cnf-create-internal-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} cloudformation internal http://{{ pillar['infra']['controller'] }}:8000/v1

heat-cnf-create-admin-enpoint:
  cmd.run:
    - name: openstack endpoint create --region {{ pillar['openstack']['region'] }} cloudformation admin http://{{ pillar['infra']['controller'] }}:8000/v1


heat-create-domain:
  cmd.run:
    - name: openstack domain create --description "{{ pillar['openstack']['heat_domain_description'] }}" heat


heat-domain-admin-create-user:
  cmd.run:
    - name: openstack user create --domain heat --password {{ pillar['password']['HEAT_DOMAIN_ADMIN'] }} heat_domain_admin


heat-domain-admin-add-role-user:
  cmd.run:
    - name: openstack role add --domain heat --user-domain heat --user heat_domain_admin admin

heat-stack-owner-create-role:
  cmd.run:
    - name: openstack role create heat_stack_owner


heat-stack-owner-role-add-user:
  cmd.run:
    - name: openstack role add --project  {{ pillar['openstack']['project_name'] }} --user {{ pillar['openstack']['cloud_user'] }} heat_stack_owner


heat-stack-user-create-role:
  cmd.run:
    - name: openstack role create heat_stack_user

{% else %}

heat-endpoint-create-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}