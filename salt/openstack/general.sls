#salt '*' cmd.run 'apt-get install software-properties-common'
#
#salt '*' cmd.run 'apt-get update && apt-get dist-upgrade -y'
#
#salt '*' cmd.run 'apt-get install -y python-openstackclient '

software-properties-common-init:
  cmd.run:
    - name: apt-get install -y software-properties-common

add-repository:
  cmd.run:
    - name: add-apt-repository -y cloud-archive:ocata

system-upgrade-init:
  cmd.run:
    - name: apt-get update && apt-get dist-upgrade -y


python-openstackclient:
  cmd.run:
    - name: apt-get install -y python-openstackclient

autoremove:
  cmd.run:
    - name: apt-get autoremove -y

