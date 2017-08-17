

/etc/hosts:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://network/files/hosts-ops


