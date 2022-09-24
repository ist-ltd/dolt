# dolt 

A simple read/write git repository server using git-http-backend and nginx, packaged into a container based on Alpine Linux. Authentication is provided using HTTP basic authentication.

## Security

This should not be used in any production scenarios. It is a  development utility. No HTTPS support is included, and only a single user is supported. Be aware of the security risks of passing sensitive information through environment variables.

## Basic usage

Simple usage from a shell with docker installed:

```bash
$ docker run -d \ # run detached
    -p 1234:80 \ # port forward 1234 to the container HTTP server
    -e GIT_REPOS=test \ # space separated repository names
    -e GIT_USERNAME=vader \ # username for authentication
    -e GIT_PASSWORD=letmein \ # password for authentication
    ghcr.io/ist-ltd/dolt:1.0.0 # change 1.0.0 for version of dolt
<...>
$ git clone http://vader:letmein@localhost:1234/repositories/test
Cloning into 'test'...
warning: You appear to have cloned an empty repository.
```

## Kubernetes usage

For a example kubernetes usage, please see [k8s-dolt.yaml](k8s-dolt.yaml).

Ensure you adjust the resources as appropriate for your environment.