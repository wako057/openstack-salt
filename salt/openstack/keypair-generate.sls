
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keypair-generate:
  cmd.run:
    - name: yes | ssh-keygen -q -t rsa -b 4096 -N "" -f /root/.ssh/id_rsa


openstack keypair create --public-key ~/.ssh/id_rsa.pub mykey

{% else %}

keypair-generate-avoid-error:
  test.nop:
    - name: minionAlive



{% endif %}
