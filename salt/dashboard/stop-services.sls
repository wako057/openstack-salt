{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

dashboard-stop:
    service.dead:
      - name: apache2

{% endif %}