trigger ProjectTrigger on Project__c (after update) {
    //Call the Billing Service callout logic here
    Set<Id> billableProjectIds = new Set<Id> ();
    List<Project__c> billableProjects = new List<Project__c> ();
    
    for (Project__c project : Trigger.new) {
        if (project.Status__c != Trigger.oldMap.get(project.Id).Status__c && project.status__c == 'Billable') {
            billableProjectIds.add(project.Id);
            billableProjects.add(project);
        }
    }
    
    if (billableProjectIds.size() > 0) {
        BillingCalloutService.callBillingService(billableProjectIds);
        //BillingCalloutService.callBillingService(billableProjects);
    }
}