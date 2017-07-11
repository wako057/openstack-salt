chrony:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/chrony/chrony.conf
    - require:
      - pkg: chrony



/etc/chrony/chrony{{ salt['grains.get']('host', '')  }}.conf:
    file.managed:
        - name: /etc/chrony/chrony.conf
        - user: root
        - group: root
        - mode: 644
        - source: salt://chrony/files/chrony-{{ salt['grains.get']('host', '') }}