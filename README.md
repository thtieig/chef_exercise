# lamp_centos7 Chef Cookbook

Chef cookbook to install a LAMP stack on a CentOS7 machine.

The current cookbook has 3 different roles:
1. **default** - basic packages and setup
2. **web** - Apache and PHP (including firewall rules)
3. **db** - MariaDB

To install all on a single server, you need to apply *web* and *db* roles to the same node.

Here some handy commands:

## Push a role to Chef Server
`knife role from file roles/web.json`
`knife role from file roles/db.json`

## Check what's available
`knife role list`

## View the role *web* pushed
`knife role show web`

## Assign a role to a specific node
`knife node run_list set node1 "role[web]"`
`knife node run_list set node2 "role[db]"`

## Verify
`knife node show node1`
`knife node show node2`

This is created **_just_** for learning purposes and is not intended for production environments.
Use it at your own risk :-)
