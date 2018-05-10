template features/cloud/openstack/rally/heat_create-and-list-stack;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/heat_create-and-list.json}';
'module' = 'json';
'contents' = dict(
    "HeatStacks.create_and_list_stack", list(
        dict(
            "args", dict(
               "template_path", "heat_template.yaml.template",
            ),
            "runner", dict(
                "type", "constant",
                "times", 10,
                "concurrency", 1,
            ),
            "context", dict(
                "users", dict(
                    "tenants", 1,
                    "users_per_tenant", 1,
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


