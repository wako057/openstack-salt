{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

heat-api-start:
    service.running:
      - name: heat-api

heat-api-cfn-start:
    service.running:
      - name: heat-api-cfn

heat-engine-start:
    service.running:
      - name: heat-engine


{% endif %}