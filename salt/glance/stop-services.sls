{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

glance-registry-stop:
    service.dead:
      - name: glance-registry

glance-api-stop:
    service.dead:
      - name: glance-api


{% else %}

glance-stop-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}