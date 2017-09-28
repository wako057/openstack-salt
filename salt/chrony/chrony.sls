chrony:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/chrony/chrony.conf
    - require:
      - pkg: chrony


{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}

/etc/chrony/chrony-controller.conf:
    file.managed:
        - name: /etc/chrony/chrony.conf
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - source: salt://chrony/files/chrony-controller

chrony-set-timezone:
  cmd.run:
    - name: timedatectl set-timezone Europe/Paris
    - runas: root

{% else %}

/etc/chrony/chrony-compute-storage.conf:
    file.managed:
        - name: /etc/chrony/chrony.conf
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - source: salt://chrony/files/chrony-compute-storage


{% endif %}



