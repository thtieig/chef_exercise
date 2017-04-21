# lamp_centos7 Chef Cookbook

Chef cookbook to install a LAMP stack on a CentOS7 machine.

The current cookbook has 3 different roles:
1. **default** - basic packages and setup
2. **web** - Apache and PHP (including firewall rules)
3. **db** - MariaDB

The roles *web* and *db* have now also integrated **chef-client** cookbook from [Chef Supermarket](https://supermarket.chef.io/). In this example, I've forced to run every 5 minutes, as per the tutorial in [Chef learn](https://learn.chef.io) website.

To make this cookbook working you must use **berks** utility to download and upload the cookbook onto the Chef Server **BEFORE** running any other commands.

The file *Berksfile* is already configured for you.

## Use of Chef Supermarket cookbook

### Download
`berks install`

You should be able to see the files physically downloaded in `~/.berkshelf/cookbooks`. Use `ls` to check.
Once done, you need to push them onto the Chef Server.

### Upload to the Chef Server
`berks upload`

Now all the files are available and you can play with the cookbook :-)


> NOTE: To install all on a single server, you need to apply *web* and *db* roles to the same node.


## Here some handy commands

### Push a role to Chef Server
```
knife role from file roles/web.json
knife role from file roles/db.json
```
### Check what's available
`knife role list`

### View the role *web* pushed
`knife role show web`

### Assign a role to a specific node
```
knife node run_list set node1 "role[web]"
knife node run_list set node2 "role[db]"
```
### Verify
```
knife node show node1
knife node show node2
```

You might find handy also to verify when the *chef-client* contacted the Chef server.
### Check pull status for web role
`knife status 'role:web' --run-list`

> Remember that if you make any change to the cookbook you always need to change the version on the *metadata.rb* file and upload it to the Chef Server, otherwise the *chef-client* will keep pulling the old version of your cookbook ;-)



DISCLAIMER: This has been created **_just_** for learning purposes and is not intended for production environments.
Use it at your own risk :-)
