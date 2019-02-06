public class BillingCalloutService {
    //Implement business and callout logic methods here
    @future(Callout=true)
    public static void callBillingService (set<Id> billableProjectIds) {
    
        List<Project__c> billableProjects = [SELECT ID, ProjectRef__c, Billable_Amount__c FROM Project__c WHERE ID IN: billableProjectIds];
        
        ServiceCredentials__c serviceCreds = ServiceCredentials__c.getInstance('BillingServiceCredential');
        
        BillingServiceProxy bsp = new BillingServiceProxy();
        
        BillingServiceProxy.Project project = new BillingServiceProxy.Project();        
        project.username = serviceCreds.Username__c;
        project.password = serviceCreds.password__c;
        project.projectRef = billableProjects[0].ProjectRef__c;
        project.billAmount = billableProjects[0].Billable_Amount__c;
        
        BillingServiceProxy.InvoicesPortSoap11 ips11 = new BillingServiceProxy.InvoicesPortSoap11();
        String msg = ips11.billProject(project);
    }
    
    //public static void callBillingService (List<Project__c> billableProjects) {
        
    //}
}