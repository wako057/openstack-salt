
    Testing purpose
Sub Project in the case of vm

You have to configure 2 file

Vagrantfile, in order to match the ip of you physical network, in order to make functionnal

bootstrap.sh, you have to fill the ip of the salt master, basically the Bridge Ip of the salt-master 

Once you are logged as root on the salt-master:

salt-key -A
