{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

{% else %}

glance-endpoint-create-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}