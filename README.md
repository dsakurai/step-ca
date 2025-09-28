Step-CA Configuration
===

Intialize step-ca
---

```
./0-initialize.sh
```

This generates the directory `step`.


Health check
---

Run the server to do a health check.

```
podman run -d -p 9000:9000 --name step-ca --userns=keep-id -v ./step:/home/step --replace smallstep/step-ca
./1-test.sh
```

Use the certificates
----

For the simplest usage, copy/distribute the public root (./step/certs/root_ca.crt) to clients so they can trust the CA.
