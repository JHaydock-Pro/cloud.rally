template features/cloud/openstack/rally/keystone_create-tenant-with-users;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/keystone_create-tenant-with-users.json}';
'module' = 'json';
'contents' = dict(
    "KeystoneBasic.create_tenant_with_users", list(
        dict(
            "args", dict(
                "users_per_tenant", 5,
            ),
            "runner", dict(
                "type", "constant",
                "times", 4,
                "concurrency", 4,
            ),
            "sla", dict(
                "failure_rate", dict(
                    "max", 0.0
                )
            ),
        ),
    ),
);

