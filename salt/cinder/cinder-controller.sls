
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

cinder-api:
    pkg.installed: []

cinder-scheduler:
    pkg.installed: []



/etc/cinder/cinder-controller.conf:
  file.managed:
    - source: salt://cinder/files/controller-cinder.conf
    - name: /etc/cinder/cinder.conf
    - template: jinja
    - require:
      - pkg: cinder-api



cinder-manage-db-sync:
  cmd.run:
    - name: cinder-manage db sync
    - runas: cinder


{% else %}

cinder-controller-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}