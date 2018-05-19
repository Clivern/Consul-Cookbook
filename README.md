Consul-Cookbook
==============

A Chef Cookbook To Install and Manage [Consul](https://www.consul.io/).

Usage
-----

1. Add the following recipes to your node run list.

```bash
{
    "run_list": [
        "recipe[clivern-consul::default]"
    ]
}
```

2. The configure the node whether it is a leader, server or client. Let's imagine we have three servers:

- Leader FQDN `x.x.x.x`.
- Client FQDN `y.y.y.y`.
- Server FQDN `z.z.z.z`.

First The Leader Node should be like the following:

```bash
{
    "name": "leader-node-01",
    "chef_environment": "_default",
    "normal": {
        "tags": [

        ],
        "consul": {
            "node_fqdn": "x.x.x.x",
            "leader_fqdn": "x.x.x.x",
            "type": "leader",
            "datacenter": "US-01"
        }
    },
    "policy_name": null,
    "policy_group": null,
    "run_list": [
        "recipe[clivern-consul::default]"
    ]
}
```

Then The Server(s) Node should be like the following:

```bash
{
    "name": "server-node-01",
    "chef_environment": "_default",
    "normal": {
        "tags": [

        ],
        "consul": {
            "node_fqdn": "z.z.z.z",
            "leader_fqdn": "x.x.x.x",
            "type": "leader",
            "datacenter": "US-01"
        }
    },
    "policy_name": null,
    "policy_group": null,
    "run_list": [
        "recipe[clivern-consul::default]"
    ]
}
```

Then The Client(s) Node should be like the following:

```bash
{
    "name": "client-node-01",
    "chef_environment": "_default",
    "normal": {
        "tags": [

        ],
        "consul": {
            "node_fqdn": "y.y.y.y",
            "leader_fqdn": "x.x.x.x",
            "type": "leader",
            "datacenter": "US-01"
        }
    },
    "policy_name": null,
    "policy_group": null,
    "run_list": [
        "recipe[clivern-consul::default]"
    ]
}
```

Then run chef-client on these servers and open `http://y.y.y.y:8500/` on your browser.


Misc
====

Changelog
---------
Version 1.0.0:
```
Initial Release.
```

Acknowledgements
----------------

© 2018, Clivern. Released under [The Apache Software License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.txt).

**Consul-Cookbook** is authored and maintained by [@clivern](http://github.com/clivern).
