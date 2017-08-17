{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

dashboard-start:
    service.running:
      - name: apache2

{% else %}

dashboard-start-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}