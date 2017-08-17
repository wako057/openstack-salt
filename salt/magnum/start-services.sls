{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

magnum-api-start:
    service.running:
      - name: magnum-api

magnum-conductor-start:
    service.running:
      - name: magnum-conductor


{% else %}

magnum-start-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}