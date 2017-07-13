{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

cinder-scheduler-start:
    service.running:
      - name: cinder-scheduler

cinder-api-start:
    service.running:
      - name: apache2

{% elif pillar['nodes'][grains['host']]['role'] == 'storage' %}

tgt-stop:
    service.dead:
      - name: tgt
cinder-volume
cinder-volume-stop:
    service.dead:
      - name: cinder-volume

{% endif %}