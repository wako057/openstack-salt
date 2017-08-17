{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

cinder-scheduler-start:
    service.running:
      - name: cinder-scheduler

cinder-api-start:
    service.running:
      - name: apache2

{% elif pillar['nodes'][grains['host']]['role'] == 'storage' %}

tgt-start:
    service.running:
      - name: tgt

cinder-volume-start:
    service.running:
      - name: cinder-volume

{% else %}

cinder-start-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}