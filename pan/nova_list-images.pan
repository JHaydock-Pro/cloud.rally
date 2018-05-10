template features/cloud/openstack/rally/nova_list-images;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/nova_list-images.json}';
'module' = 'json';
'contents' = dict(
    "NovaImages.list_images", list(
        dict(
            "runner", dict(
                "type", "constant",
                "concurrency", 2,
                "times", 4,
            ),
            "args", dict(
                "detailed", true
            ),
            "context", dict(
                "users", dict(
                    "tenants", 3,
                    "users_per_tenant", 2
                )
            ),
            "sla", dict(
                "failure_rate", dict(
                    "max", 0.0
                )
            ),
        ),
    ),
);
