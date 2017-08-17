{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

dashboard-stop:
    service.dead:
      - name: apache2

{% else %}

dashboard-stop-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}