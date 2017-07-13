{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone-stop:
    service.dead:
      - name: apache2

{% endif %}