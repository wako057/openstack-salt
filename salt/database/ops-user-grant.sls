{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

keystone_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: localhost

keystone_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: keystone.*
    - user: keystone
    - host: '%'

glance_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: localhost

glance_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: glance.*
    - user: glance
    - host: '%'


nova_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: localhost

nova_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova.*
    - user: nova
    - host: '%'

nova_api_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: localhost

nova_api_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova_api.*
    - user: nova
    - host: '%'

nova_cell0_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: localhost

nova_cell0_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: nova_cell0.*
    - user: nova
    - host: '%'

neutron_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: neutron.*
    - user: neutron
    - host: localhost

neutron_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: neutron.*
    - user: neutron
    - host: '%'

cinder_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: cinder.*
    - user: cinder
    - host: localhost

cinder_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: cinder.*
    - user: cinder
    - host: '%'


heat_grant_LOCAL:
  mysql_grants.present:
    - grant: all privileges
    - database: heat.*
    - user: heat
    - host: localhost

heat_grant_ALL:
  mysql_grants.present:
    - grant: all privileges
    - database: heat.*
    - user: heat
    - host: '%'


{% endif %}