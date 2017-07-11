
{% if pillar['infra'][grains['host']] == 'controller' %}

python-memcache:
    pkg.installed: []


memcached:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/memcached.conf

    - require:
      - pkg: memcached


/etc/memcached.conf:
    file.managed:
        - name: /etc/memcached.conf
        - user: root
        - group: root
        - mode: 644
        - source: salt:///memcached/memcached.conf

{% endif %}