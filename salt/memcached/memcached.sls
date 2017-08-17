
{% if pillar['nodes'][grains['host']]['role'] == 'controller' %}


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
        - template: jinja
        - user: root
        - group: root
        - mode: 644
        - source: salt:///memcached/files/memcached.conf

{% else %}

memcached-avoid-error:
  test.nop:
    - name: minionAlive

{% endif %}