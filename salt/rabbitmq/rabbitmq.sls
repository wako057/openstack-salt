

{% if pillar['infra'][grains['host']] == 'controller' %}

rabbitmq-server:
  pkg.installed: []
  service.running:
    - require:
      - pkg: rabbitmq-server


rabbit_user:
  rabbitmq_user.present:
    - name: openstack
    - password: {{ pillar['password']['RABBIT_PASS'] }}
    - force: True
    - tags:
      - monitoring
      - user
    - perms:
      - '/':
        - '.*'
        - '.*'
        - '.*'
    - runas: root

{% endif %}