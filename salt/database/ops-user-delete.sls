{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

database-delete-keystone_LOCAL:
  mysql_user.absent:
    - name: keystone
    - host: localhost
    - database: keystone.*
    - grant: all
    - connection_user: root

database-delete-keystone_ALL:
  mysql_user.absent:
    - name: keystone
    - host: '%'

database-delete-glance_LOCAL:
  mysql_user.absent:
    - name: glance
    - host: localhost
    - database: glance.*

database-delete-glance_ALL:
  mysql_user.absent:
    - name: glance
    - host: '%'
    - database: glance.*

database-delete-nova_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova.*

database-delete-nova_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova.*

database-delete-nova_api_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova_api.*

database-delete-nova_api_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova_api.*

database-delete-nova_cell0_LOCAL:
  mysql_user.absent:
    - name: nova
    - host: localhost
    - database: nova_cell0.*

database-delete-nova_cell0_ALL:
  mysql_user.absent:
    - name: nova
    - host: '%'
    - database: nova_cell0.*


database-delete-neutron_LOCAL:
  mysql_user.absent:
    - name: neutron
    - host: localhost

database-delete-neutron_ALL:
  mysql_user.absent:
    - name: neutron
    - host: '%'

database-delete-cinder_LOCAL:
  mysql_user.absent:
    - name: cinder
    - host: localhost

database-delete-cinder_ALL:
  mysql_user.absent:
    - name: cinder
    - host: '%'

database-delete-heat_LOCAL:
  mysql_user.absent:
    - name: heat
    - host: localhost

database-delete-heat_ALL:
  mysql_user.absent:
    - name: heat
    - host: '%'

database-delete-magnum_LOCAL:
  mysql_user.absent:
    - name: magnum
    - host: localhost

database-delete-magnum_ALL:
  mysql_user.absent:
    - name: magnum
    - host: '%'

{% else %}

mysql-userdelete-avoid-error:
  test.nop:
    - name: minionAlive


{% endif %}