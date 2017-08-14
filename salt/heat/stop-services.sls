{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

heat-api-stop:
    service.dead:
      - name: heat-api

heat-api-cfn-stop:
    service.dead:
      - name: heat-api-cfn

heat-engine-stop:
    service.dead:
      - name: heat-engine

{% endif %}