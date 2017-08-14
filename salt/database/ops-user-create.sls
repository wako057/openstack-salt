{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

database-create-keystone_LOCAL:
  mysql_user.present:
    - name: keystone
    - host: localhost
    - database: keystone.*
    - grant: all
    - password: {{ pillar['password']['KEYSTONE_DBPASS'] }}
    - connection_user: root

database-create-keystone_ALL:
  mysql_user.present:
    - name: keystone
    - host: '%'
    - grant: all
    - database: keystone.*
    - password: {{ pillar['password']['KEYSTONE_DBPASS'] }}
    - connection_user: root


database-create-glance_LOCAL:
  mysql_user.present:
    - name: glance
    - host: localhost
    - database: glance.*
    - grant: all
    - password: {{ pillar['password']['GLANCE_DBPASS'] }}
    - connection_user: root

database-create-glance_ALL:
  mysql_user.present:
    - name: glance
    - host: '%'
    - database: glance.*
    - grant: all
    - password: {{ pillar['password']['GLANCE_DBPASS'] }}
    - connection_user: root


database-create-nova_LOCAL:
  mysql_user.present:
    - name: nova
    - host: localhost
    - database: nova.*
    - grant: all
    - password: {{ pillar['password']['NOVA_DBPASS'] }}
    - connection_user: root

database-create-nova_ALL:
  mysql_user.present:
    - name: nova
    - host: '%'
    - database: nova.*
    - grant: all
    - password: {{ pillar['password']['NOVA_DBPASS'] }}
    - connection_user: root


database-create-neutron_LOCAL:
  mysql_user.present:
    - name: neutron
    - host: localhost
    - grant: all
    - password: {{ pillar['password']['NEUTRON_DBPASS'] }}
    - connection_user: root

database-create-neutron_ALL:
  mysql_user.present:
    - name: neutron
    - host: '%'
    - grant: all
    - password: {{ pillar['password']['NEUTRON_DBPASS'] }}
    - connection_user: root

database-create-cinder_LOCAL:
  mysql_user.present:
    - name: cinder
    - host: localhost
    - grant: all
    - password: {{ pillar['password']['CINDER_DBPASS'] }}
    - connection_user: root

database-create-cinder_ALL:
  mysql_user.present:
    - name: cinder
    - host: '%'
    - grant: all
    - password: {{ pillar['password']['CINDER_DBPASS'] }}
    - connection_user: root

database-create-heat_LOCAL:
  mysql_user.present:
    - name: heat
    - host: localhost
    - grant: all
    - password: {{ pillar['password']['HEAT_DBPASS'] }}
    - connection_user: root

database-create-heat_ALL:
  mysql_user.present:
    - name: heat
    - host: '%'
    - grant: all
    - password: {{ pillar['password']['HEAT_DBPASS'] }}
    - connection_user: root


{% endif %}