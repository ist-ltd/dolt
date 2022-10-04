# dolt 

A simple read/write git repository server hosted with openssh, packaged into a container based on Alpine Linux.

## Security

This should not be used in production scenarios. It is a  development utility. 

## Basic usage

Simple usage from a shell with docker installed:

```bash
$ ssh-keygen -t ed25519 -f host_key -q -N "" # create host key
$ ssh-keygen -t ed25519 -f user_key -q -N "" # create user key

$ docker create volume keys # create volume for storing SSH keys
$ docker create volume git # create volume for storing Git repositories
$ docker run --name keycopy -it --rm -v keys:/mnt/keys ubuntu 

# in another shell...
$ docker cp host_key keycopy:/mnt/keys/ssh_host_rsa_key
$ docker cp user_key.pub keycopy:/mnt/keys/authorized_keys

# back in the original shell
$ chmod 600 /mnt/keys/ssh_host_rsa_key
$ chmod 644 /mnt/keys/authorized_keys
$ exit
$ docker run --rm -it \ 
    -v git:/srv/git
    -v keys:/mnt/keys
    -p 1234:80 \ # port forward 1234 to the container SSH server
    ghcr.io/ist-ltd/dolt:2.0.0 # change 1.0.0 for version of dolt
Server listening on 0.0.0.0 port 22.
Server listening on :: port 22.

# update your ~/.ssh/config to the following
Host dolt
  HostName localhost
  User git
  Port 1234
  IdentityFile path/to/user_key

# in a shell
$  ssh dolt
git> create hello
git> exit
$ git clone dolt:/srv/git/hello.git
Cloning into 'hello'...
warning: You appear to have cloned an empty repository.

```