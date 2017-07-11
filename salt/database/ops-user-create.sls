{% if pillar['infra'][grains['host']] == 'controller' %}

keystone_LOCAL:
  mysql_user.present:
    - name: keystone
    - host: localhost
    - database: keystone.*
    - grant: all
    - password: {{ pillar['password']['KEYSTONE_DBPASS'] }}
    - connection_user: root

keystone_ALL:
  mysql_user.present:
    - name: keystone
    - host: '%'
    - grant: all
    - database: keystone.*
    - password: {{ pillar['password']['KEYSTONE_DBPASS'] }}
    - connection_user: root


glance_LOCAL:
  mysql_user.present:
    - name: glance
    - host: localhost
    - database: glance.*
    - grant: all
    - password: {{ pillar['password']['GLANCE_DBPASS'] }}
    - connection_user: root

glance_ALL:
  mysql_user.present:
    - name: glance
    - host: '%'
    - database: glance.*
    - grant: all
    - password: {{ pillar['password']['GLANCE_DBPASS'] }}
    - connection_user: root


nova_LOCAL:
  mysql_user.present:
    - name: nova
    - host: localhost
    - database: nova.*
    - grant: all
    - password: {{ pillar['password']['NOVA_DBPASS'] }}
    - connection_user: root

nova_ALL:
  mysql_user.present:
    - name: nova
    - host: '%'
    - database: nova.*
    - grant: all
    - password: {{ pillar['password']['NOVA_DBPASS'] }}
    - connection_user: root


neutron_LOCAL:
  mysql_user.present:
    - name: neutron
    - host: localhost
    - grant: all
    - password: {{ pillar['password']['NEUTRON_DBPASS'] }}
    - connection_user: root

neutron_ALL:
  mysql_user.present:
    - name: neutron
    - host: '%'
    - grant: all
    - password: {{ pillar['password']['NEUTRON_DBPASS'] }}
    - connection_user: root


{% endif %}