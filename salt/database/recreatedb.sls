{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

include:
    - database.ops-user-revoke
    - database.ops-user-delete
    - database.ops-database-delete
    - database.ops-database-create
    - database.ops-user-create
    - database.ops-user-grant

{% endif %}