@isTest
public class AddPrimaryContactTest {
	@testSetup
    public static void createAccounts () {
        List<Account> accounts = new List<Account> ();
        for (Integer i=0;i<50;i++) {
            accounts.add(new Account (name='test'+i,BillingState='NY'));
        }
        for (Integer j=0;j<50;j++) {
            accounts.add(new Account (name='teste'+j,BillingState='CA'));
        }
        insert accounts;
        Contact con = new Contact (lastname='testContact',firstname='test');
        insert con;
    }
    
    @isTest static void unitTest1 () {
        Contact con = [select id,firstname,lastname from contact where lastname = 'testContact' limit 1];
        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact (con,state);
        Test.startTest();
        	system.enqueueJob(apc);
        Test.stopTest();
        Map<Id, Account> accs = new Map<Id, Account>([select id from account where billingstate='CA']);
        system.assertEquals([select count() from contact where accountId In: accs.keySet()],50);
        List<Contact> contacts = [select id, account.billingstate from contact where name like 'testContact' and accountID != null];
        for (Contact contact : contacts) {
            system.assertEquals(contact.account.billingstate, 'CA');
        }
    }
    
    @isTest static void unitTest2 () {
        Contact con = new Contact(LastName = 'TestCont');
        AddPrimaryContact addPrimCon = new AddPrimaryContact(CON ,'CA');
        
        Test.startTest();
        System.enqueueJob(addPrimCon);
        Test.stopTest();
        
        System.assertEquals(50, [select count() from Contact]);
    }
}