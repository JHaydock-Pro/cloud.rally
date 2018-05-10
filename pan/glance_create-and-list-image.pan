template features/cloud/openstack/rally/glance_create-and-list-image;

include 'components/metaconfig/config';

prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/glance_create-and-list-image.json}';
'module' = 'json';
'contents' =  dict(
    "GlanceImages.create_and_list_image", list(
        dict(
            "args", dict(
                "image_location", "http,//download.cirros-cloud.net/0.3.5/cirros-0.3.5-x86_64-disk.img",
                "container_format", "bare",
                "disk_format", "qcow2"
            ),
            "runner", dict(
                "type", "constant",
                "times", 4,
                "concurrency", 2
            ),
        ),
    ),
);
