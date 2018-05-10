template features/cloud/openstack/rally/vm_boot-runcommand-delete;

include 'components/metaconfig/config';
variable OPENSTACK_RALLY_IMAGES_DICT = dict(
    "ScientificLinux-7-NoGui", "fedora",
    "ScientificLinux-7-Gui", "fedora",
    "ScientificLinux-7-AQ", "fedora",
    "ScientificLinux-6-NoGui", "cloud-user",
    "ScientificLinux-6-Gui", "cloud-user",
    "ScientificLinux-6-AQ", "cloud-user",
    "Ubuntu-Trusty-NoGui", "ubuntu",
    "Ubuntu-Trusty-Gui", "ubuntu",
    "Ubuntu-Xenial-NoGui", "ubuntu",
    "Ubuntu-Xenial-Gui", "ubuntu"
);

variable OPENSTACK_RALLY_BOOT_RUNCOMMAND_DELETE_IMAGES = list();
variable OPENSTACK_RALLY_BOOT_RUNCOMMAND_DELETE_IMAGES = { images = list();
    foreach (imagename; username; OPENSTACK_RALLY_IMAGES_DICT) {
        images = append(SELF, dict(
            'args', dict(
                'flavor', dict(
                     'name', 'm1.tiny'
                ),
                'image', dict(
                    'name', imagename,
                ),
                'fixednetwork', 'public',
                'use_floating_ip', false,
                'force_delete', false,
                'command', dict(
                    'interpreter', '/bin/bash',
                    'script_file', '/etc/openstack-utils/rally.d/vm_instance_test-modified.sh',
                ),
                'username', username,
            ),
            'runner', dict(
                'type', 'constant',
                'times', 4,
                'concurrency', 4,
                'timeout', 180,
            ),
            'context', dict(
            ),
            'sla', dict(
                'failure_rate', dict(
                    'max', 25.0,
                )
            ),
        ));
    };
    images;
};




prefix '/software/components/metaconfig/services/{/etc/openstack-utils/rally.d/vm_boot-runcommand-delete.json}';
'module' = 'json';
'contents' = dict('VMTasks.boot_runcommand_delete', OPENSTACK_RALLY_BOOT_RUNCOMMAND_DELETE_IMAGES);
