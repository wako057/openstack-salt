{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

magnum-api-stop:
    service.dead:
      - name: magnum-api

magnum-conductor-stop:
    service.dead:
      - name: magnum-conductor



{% else %}

magnum-stop-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}