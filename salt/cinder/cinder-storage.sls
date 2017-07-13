{% if pillar['nodes'][grains['host']]['role'] == 'storage' %}

lvm2:
    pkg.installed: []

cinder-volume:
    pkg.installed: []


cinder-create-pvcreate:
  cmd.run:
    - name: pvcreate -f /dev/sdb

cinder-create-vgcreate:
  cmd.run:
    - name: vgcreate cinder-volumes /dev/sdb


/etc/lvm/lvm.conf:
  file.managed:
    - source: salt://cinder/files/lvm.conf
    - template: jinja
    - require:
      - pkg: cinder-volume


/etc/cinder/cinder-controller.conf:
  file.managed:
    - source: salt://cinder/files/storage-cinder.conf
    - name: /etc/cinder/cinder.conf
    - template: jinja
    - require:
      - pkg: cinder-volume


{% endif %}