
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

non-interactive-install:
    environ.setenv:
        - name: doesnotmatter
        - value:
            DEBIAN_FRONTEND: noninteractive


install-magnum:
  cmd.run:
    -name: apt-get install -y magnum-api magnum-conductor python-magnumclient
#magnum-api:
#  pkg.installed: []
#
#magnum-conductor:
#  pkg.installed: []
#
#python-magnumclient:
#  pkg.installed: []


magnum-manage-db-sync:
  cmd.run:
    - name: magnum-db-manage upgrade
    - runas: magnum


{% endif %}