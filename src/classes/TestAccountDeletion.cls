@isTest
public class TestAccountDeletion{
    @isTest static void TestDeleteAccountWithOneOpportunity(){
        Account acct = new Account(Name = 'testing account delete');    
        insert acct;
        Opportunity opp = new Opportunity(Name = 'testing opportunity delete',
                                         StageName = 'Prospecting',
                                         CloseDate = system.today().addMonths(1),
                                         AccountId = acct.Id);
        insert opp;
        
        //Testing
        Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);                                        
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities.', result.getErrors()[0].getMessage());                        
    }    
}