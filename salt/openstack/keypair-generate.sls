
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keypair-generate:
  cmd.run:
    - name: yes | ssh-keygen -q -t rsa -b 4096 -N "" -f /root/.ssh/id_rsa


{% else %}

keypair-generate-avoid-error:
  test.nop:
    - name: minionAlive



{% endif %}
