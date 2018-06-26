@istest
private class AccountManagerTest {
	
    static Id createAccountsWithContacts () {
        Account acc = new account (name='Test+++');
        insert acc;
        List<Contact> cons = new List<Contact> ();
        for (Integer i=0;i<10;i++) {
            cons.add(new contact(lastname='test',accountId=acc.Id));
        }
        insert cons;
        return acc.Id;
    }
    
    @isTest static void testGetAccount () {
        Id accID = createAccountsWithContacts();
        RestRequest request = new RestRequest ();
        request.requestURI = 'https://ap1.salesforce.com/services/apexrest/Accounts/' + accId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account output = AccountManager.getAccount();
        //system.assertEquals(output.Name,'Test+++');
        //system.assertEquals(output.contacts.size(),10);
    }
}