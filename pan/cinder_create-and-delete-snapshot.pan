template features/cloud/openstack/rally/cinder_create-and-delete-snapshot;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/cinder_create-and-delete-snapshot.json}';
'module' = 'json';
'contents' = dict(
    "CinderVolumes.create_and_delete_snapshot", list(
        dict(
            "args", dict(
                "force", false
            ),
            "runner", dict(
                "type", "constant",
                "times", 4,
                "concurrency", 2
            ),
            "context", dict(
                "volumes", dict(
                    "size", 1
                ),
            ),
            "sla", dict(
                "failure_rate", dict(
                    "max", 25.0,
                )
            ),
        ),
    ),
);
