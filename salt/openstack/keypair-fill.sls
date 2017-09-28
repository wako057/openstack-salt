
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - openstack.environnement-user

keypair-fill:
  cmd.run:
    - name: openstack keypair create --public-key ~/.ssh/id_rsa.pub {{ pillar['openstack']['cloud_user'] }}

{% else %}

keypair-fill-avoid-error:
  test.nop:
    - name: minionAlive



{% endif %}
