{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_grant_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: localhost

keystone_grant_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: '%'



glance_grant_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: localhost

glance_grant_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: '%'


nova_grant_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: localhost

nova_grant_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: '%'

nova_api_grant_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: localhost

nova_api_grant_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: '%'

nova_cell0_grant_LOCAL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: localhost

nova_cell0_grant_ALL:
  mysql_grants.absent:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: '%'


{% endif %}