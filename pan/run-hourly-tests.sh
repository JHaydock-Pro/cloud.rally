#!/bin/bash


/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/cinder_create-and-delete-snapshot.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/keystone_create-tenant-with-users.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/glance_create-and-list-image.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/heat_create-and-list-stack.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/neutron_create-and-list-floating-ips.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/nova_list-images.json
/usr/local/bin/rally-run-test /etc/openstack-utils/rally.d/vm_boot-runcommand-delete.json
