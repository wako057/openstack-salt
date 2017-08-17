{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

mysql-stop:
    service.dead:
      - name: mysql

{% else %}

mysql-stop-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}