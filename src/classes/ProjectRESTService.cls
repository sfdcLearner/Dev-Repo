@RestResource(urlMapping='/project/*')
global with sharing class ProjectRESTService {
    //Implement service logic here
    @HttpPost
    global static String postProjectData (String ProjectRef, String ProjectName, 
                                          String OpportunityId, Date StartDate, 
                                          Date EndDate, Double Amount, String Status) {
        System.savepoint sp = Database.setSavepoint();
        try{
            Id opId = Id.valueof(opportunityId);
            if (opId == null) return 'error';
            
            List<Opportunity> opp = [select id, DeliveryInstallationStatus__c from opportunity where id =: opId];
            
            if (opp.size() < 1) { return 'error';}
            
            Project__c proj = new Project__c();
            proj.ProjectRef__c=ProjectRef;
            proj.name=ProjectName;
            proj.Opportunity__c=opId;
            proj.Start_Date__c=StartDate;
            proj.End_Date__c=EndDate;
            proj.Billable_Amount__c=Amount;
            proj.Status__c=Status;
            upsert proj;
            opp[0].DeliveryInstallationStatus__c = 'In progress';
            update opp;
        } catch (exception e) {
            Database.rollback(sp);
            return e.getMessage();
        }
        return 'OK';
        
    }
    
}