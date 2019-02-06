@isTest
private class ProjectRESTServiceTest {
    
    @testSetup
    public static void setupdate () {
        Account newAcc = new Account (Name='testAcc');
        insert newAcc;
        Opportunity newOpp = new Opportunity (accountid=newAcc.Id,Name='testOpp',amount=123.45,closedate=system.today(),stagename='Prospecting');
        insert newOpp;
    }
  //Implement Apex REST service tests here
    @isTest static void testPostMethod () {
        RestRequest request = new RestRequest ();
        request.requestURI = 'https://jp91-dev-ed.my.salesforce.com/services/apexrest/project/';
        request.httpMethod = 'POST';
        RestContext.request = request;
        
        Date startDate = System.today();
        Date endDate = System.today().adddays(2);
        
        String oppId = String.valueOf([select id from opportunity where name=:'testOpp' limit 1].Id);
        
        Double amount = 123.00;
        
        String msg = ProjectRESTService.postProjectData('123456789','Test', oppId, startDate, endDate, amount, 'Running');
        System.assertEquals('OK',msg);
        
        oppId = null;
        
        msg = ProjectRESTService.postProjectData('123456789','Test', oppId, startDate, endDate, amount, 'Running');
        
                        
    }
}