{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

cinder-scheduler-stop:
    service.dead:
      - name: cinder-scheduler

cinder-api-stop:
    service.dead:
      - name: apache2

{% elif pillar['nodes'][grains['host']]['role'] == 'storage' %}

tgt-stop:
    service.dead:
      - name: tgt

cinder-volume-stop:
    service.dead:
      - name: cinder-volume

{% else %}

cinder-stop-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}