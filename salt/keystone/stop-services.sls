{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone-stop:
    service.dead:
      - name: apache2

{% else %}

keystone-stop-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}