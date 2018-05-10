template features/cloud/openstack/rally/neutron_create-and-list-floating-ips;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/neutron_create-and-list-floating-ips.json}';
'module' = 'json';
'contents' = dict(
    "NeutronNetworks.create_and_list_floating_ips", list(
        dict(
            "args", dict(
                "floating_network", "External",
                "floating_ip_args", dict()
            ),
            "runner", dict(
                "type", "constant",
                "times", 4,
                "concurrency", 2,
            ),
            "context", dict(
                "users", dict(
                    "tenants", 2,
                    "users_per_tenant", 3
                ),
                "quotas", dict(
                    "neutron", dict(
                        "floatingip", -1
                    ),
                ),
            ),
            "sla", dict(
                "failure_rate", dict(
                    "max", 0.0 
                )
            ),
        ),
    ),
);
