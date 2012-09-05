VulnDB HQ plugin for the Dradis
===============================

This plugin can be used to connect the Dradis Framework to a remote vulnerability
database such as VulnDB HQ (http://vulndbhq.com/). The idea is to have a database
with commonly used notes that you can import to your current project. 

The current version of the plugin uses the [vulndbhq gem](https://github.com/securityroots/vulndbhq)
to access the service API

You can also use the Thor task to search Vuln::DB from the command line:

$ thor dradis:import:vulndb:search XSS