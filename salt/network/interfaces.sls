

/etc/network/interfaces-{{ salt['grains.get']('host', '') }}:
    file.managed:
        - name: /etc/network/interfaces
        - user: root
        - group: root
        - mode: 644
        - source: salt://network/files/interfaces-{{ salt['grains.get']('host', '') }}
