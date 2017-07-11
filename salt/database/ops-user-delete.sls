{% if pillar['infra'][grains['host']] == 'controller' %}

keystone_LOCAL:
  mysql_user.absent:
    - name: keystone
    - host: localhost
    - database: keystone.*
    - grant: all
    - connection_user: root

keystone_ALL:
  mysql_user.absent:
    - name: keystone
    - host: '%'

glance_LOCAL:
  mysql_user.absent:
    - name: glance
    - host: localhost
    - database: glance.*

glance_ALL:
  mysql_user.absent:
    - name: glance
    - host: '%'
    - database: glance.*

nova_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova.*

nova_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova.*

nova_api_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova_api.*

nova_api_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova_api.*

nova_cell0_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova_cell0.*

nova_cell0_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova_cell0.*


neutron_LOCAL:
  mysql_user.absent:
    - name: neutron
    - host: localhost

neutron_ALL:
  mysql_user.absent:
    - name: neutron
    - host: '%'

{% endif %}