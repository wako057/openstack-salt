{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: localhost

keystone_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: '%'



glance_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: localhost

glance_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: '%'


nova_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: localhost

nova_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: '%'

nova_api_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: localhost

nova_api_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: '%'

nova_cell0_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: localhost

nova_cell0_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: '%'

cinder_revoke_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: cinder.*
    - user: cinder
    - host: localhost

cinder_revoke_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: cinder.*
    - user: cinder
    - host: '%'

{% endif %}