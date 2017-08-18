{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

nova-api-stop:
    service.dead:
      - name: nova-api

nova-consoleauth-stop:
    service.dead:
      - name: nova-consoleauth


nova-scheduler-stop:
    service.dead:
      - name: nova-scheduler


nova-conductor-stop:
    service.dead:
      - name: nova-conductor

nova-novncproxy-stop:
    service.dead:
      - name: nova-novncproxy

{% elif pillar['nodes'][grains['host']]['role'] == 'compute' %}

nova-compute-stop:
    service.dead:
      - name: nova-compute

{% else %}

nova-stop-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}