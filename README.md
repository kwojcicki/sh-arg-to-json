# sh-arg-to-json

## Usage:

Used for transforming argument parameters to a shell/python script into a json blob that can be used in a curl call to a FaaS provider.

```
kwojcicki@ubuntu:~/workspace/sh-arg-to-json$ ./transform.sh --f param1 --test param2 --file /etc/hostname --fakefile /etc/hostfakename
{ "--f": "param1", "--test": "param2", "--file": "ubuntu\n", "--fakefile": "/etc/hostfakename" }
```

Append @notfile to ensure the potential filename is kept as is
```
kwojcicki@ubuntu:~/workspace/sh-arg-to-json$ ./transform.sh --test@notfile /etc/hostname
{ "--test@notfile": "/etc/hostname" }
```
