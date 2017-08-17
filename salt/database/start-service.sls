{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

mysql-start:
    service.running:
      - name: mysql

{% else %}

mysql-start-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}