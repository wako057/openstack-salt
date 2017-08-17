{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone-start:
    service.running:
      - name: apache2

{% else %}

keystone-start-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}