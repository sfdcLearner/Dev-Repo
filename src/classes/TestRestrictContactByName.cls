@isTest
public class TestRestrictContactByName{
    @isTest static void testInvalid(){
        Contact newContact = new contact(FirstName = 'Testing',
                                      LastName = 'INVALIDNAME');
        //Testing..
        Test.startTest();
        Database.SaveResult result = Database.Insert(newContact, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
    }    
}