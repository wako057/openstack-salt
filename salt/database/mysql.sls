
{% if pillar['infra'][grains['host']] == 'controller' %}

mariadb-server:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/mysql/mariadb.conf.d/99-openstack.cnf
    - name: mysql
    - require:
      - pkg: mariadb-server




/etc/mysql/mariadb.conf.d/99-openstack.cnf:
  file.managed:
    - name: /etc/mysql/mariadb.conf.d/99-openstack.cnf
    - source: salt://database/mariadb.conf.d/99-openstack.cnf
    - template: jinja


{% endif %}