# Enable Resource Health Alerts

## Overview

Resource health is by default  enabled on [certain resources](https://learn.microsoft.com/en-us/azure/service-health/resource-health-checks-resource-types) but alerting is not!

![Reource Health](./Images/2022-12-09_12-06-42.png)

You dont need to enable anything to figure out the health. Its already there but you need to create Alerts.

At the end of the post you will find the solution that you can go ahead and start using it.

## Understand Alert Creation & Best practice

Alert creation can be created in two ways;
- ***Manually using portal:*** This can be a way to learn the experience but does not scale. Imagine you need to create resource health alerts for 100 web apps. Good luck with that! I wont cover this in this tutorial its basic, each resource has resource health tab and then create reasource health wizzard, yes just follow the wizzard, you are good to go!
- ***Creating alerts programatically:*** this might be best way in enterprises, it also fits into DevOps pipelines. We need Arm and ***PowerShell*** for this!

Okay. We decided on the Programmatic way ? lets continue...

## Programatic way of Creating Resource Health Alerts

As we discussed earlier, it will be arm and powershell but before diving into the code sample and details lets decide our scope.

We can create an alert rule that is scoped on;
- ***Subscription based:*** In this case all the resources that supports resource health will alert. I wouldnt recommend this one as it will generate noise for the resources that are not that critical.
- ***Resource based:*** We can specify each resource and add the resourceids in our scope. Well.. I would only recommend this if you can manage the ids with an outer programatic way and solution. This can be applicable only if you really need and requires additional code and maintenance effort and probably a good tag management...
- ***Resource Type Based:*** *I think this is a great point to start.* It is **best of both worlds**. Choose your critical resource types and enable the alerting based on resource those resource types. 

I suggest to start with the Resource  Type based approach and as a second phase move to resource based with a solution which should be super&uber dynamic. Probably a script that is based on tags..

>***Note:***  In this code sample I will go with the Resource Type Based scenario. 

