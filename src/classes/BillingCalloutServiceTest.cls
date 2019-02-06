@isTest
private class BillingCalloutServiceTest {
    
    @testSetup static void setupData () {
        ServiceCredentials__c creds = new ServiceCredentials__c();
        creds.name = 'BillingServiceCredential';
            creds.userName__c = 'bsUser1';
            creds.password__c = 'bsPass1';
        insert creds;
        
        Account newAcc = new Account (Name='testAcc');
        insert newAcc;
        
        Opportunity newOpp = new Opportunity (accountid=newAcc.Id,Name='testOpp',amount=123.45,closedate=system.today(),stagename='Prospecting');
        insert newOpp;
        
        Project__c project = new Project__c ();
            project.Billable_Amount__c = 123.45;
            project.name = 'testProject';
            project.ProjectRef__c = '123456';
            project.opportunity__c = newOpp.Id;
            project.status__c = 'Running';
        insert project;
    }
    
    //Implement mock callout tests here
    @isTest static void testSuccessCase () {
        Test.setMock(HttpCalloutMock.class, new BillingCalloutServiceMock ());
        
        List<Project__c> projects = [SELECT Id, Billable_Amount__c, ProjectRef__c, status__c FROM Project__c WHERE name = 'testProject'];
        projects[0].status__c = 'Billable';
        update projects;
        
    }
    
    @isTest static void testFailureCase () {
        Test.setMock(HttpCalloutMock.class, new BillingCalloutServiceMockFailure ());
        
        List<Project__c> projects = [SELECT Id, Billable_Amount__c, ProjectRef__c, status__c FROM Project__c WHERE name = 'testProject'];
        projects[0].status__c = 'Billable';
        projects[0].ProjectRef__c = '';
        update projects;
    }
}