@isTest
private class ProjectCalloutServiceTest {
	
    @testSetup
    public static void setDate () {
		ServiceTokens__c token = new ServiceTokens__c(name='ProjectServiceToken',token__c='55f0dfb8-22bf-4d07-a2d0-0c8c01747239');
        insert token;
        Account newAcc = new Account (Name='testAcc');
        insert newAcc;
        Opportunity newOpp = new Opportunity (accountid=newAcc.Id,Name='testOpp',amount=123.45,closedate=system.today(),stagename='Prospecting');
        insert newOpp;
    }
    
    //Implement mock callout tests here
    @isTest Static void testCallout () {
        Test.setMock(HttpCalloutMock.Class, new ProjectCalloutServiceMock ());
        Test.startTest();
        Opportunity opp = [select id from opportunity where name = 'testOpp' limit 1];
        ProjectCalloutService.QueueablePMSCall x = new ProjectCalloutService.QueueablePMSCall(opp.Id);
        system.enqueueJob(x);
        Test.stopTest();
    }
    
    @isTest static void testCalloutFailure () {
        Test.setMock(HttpCalloutMock.class, new ProjectCalloutServiceMockFailure ());
        Test.startTest();
        Opportunity opp = [select id from opportunity where name = 'testOpp' limit 1];
        ProjectCalloutService.QueueablePMSCall x = new ProjectCalloutService.QueueablePMSCall(opp.Id);
        system.enqueueJob(x);
        Test.stopTest();
        
    }
    
}