
{% if pillar['infra'][grains['host']] == 'controller' %}

keystone:
    pkg.installed: []


/etc/keystone/keystone.conf:
  file.managed:
    - source: salt://keystone/files/keystone.conf
    - template: jinja
    - require:
      - pkg: keystone


keystone-manage-db-sync:
  cmd.run:
    - name: keystone-manage db_sync
    - runas: keystone


keystone-manage-fernet-setup:
  cmd.run:
    - name: keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone

keystone-manage-credential-setup:
  cmd.run:
    - name: keystone-manage credential_setup --keystone-user keystone --keystone-group keystone


keystone-manage-bootstrap:
  cmd.run:
    - name: keystone-manage bootstrap --bootstrap-password {{ pillar['password']['ADMIN_PASS'] }} --bootstrap-admin-url http://{{ pillar['infra']['controller'] }}:35357/v3/ --bootstrap-internal-url http://{{ pillar['infra']['controller'] }}:5000/v3/ --bootstrap-public-url http://{{ pillar['infra']['controller'] }}:5000/v3/ --bootstrap-region-id {{ pillar['infra']['region'] }}

apache2:
    pkg.installed: []
    service.running:
      - watch:
        - file: /etc/apache2/apache2.conf

/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://keystone/files/apache2.conf
    - template: jinja
    - require:
      - pkg: apache2


supression_old_keystone_db:
  file.absent:
    - name: /var/lib/keystone/keystone.db

{% endif %}