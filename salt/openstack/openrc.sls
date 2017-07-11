

/root/admin-openrc:
  file.managed:
    - source: salt://openstack/files/admin-openrc
    - name: /root/admin-openrc
    - template: jinja

/root/demo-openrc:
  file.managed:
    - source: salt://openstack/files/demo-openrc
    - name: /root/{{ pillar['openstack']['cloud_user'] }}-openrc
    - template: jinja