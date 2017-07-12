
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.admin-environnement


#glance-delete-public-enpoint:
#  cmd.run:
#    - name: openstack endpoint delete id
#
#glance-delete-internal-enpoint:
#  cmd.run:
#    - name: openstack endpoint create --region {{ pillar['infra']['region'] }} image internal http://{{ pillar['infra']['controller'] }}:9292
#
#glance-delete-admin-enpoint:
#  cmd.run:
#    - name: openstack endpoint create --region {{ pillar['infra']['region'] }} image admin http://{{ pillar['infra']['controller'] }}:9292
#
#
glance-delete-service:
  cmd.run:
    - name: openstack service delete glance


glance-delete-user:
  cmd.run:
    - name: openstack user delete glance


{% endif %}
