@isTest
public class AccountProcessorTest {
    @isTest(seealldata=true) static void myUnitTest () {
        Test.startTest();
        Map<Id,account> accs = createAccounts();
        AccountProcessor.countContacts(accs.keyset());
        Test.stopTest();
        Integer count = [select count() from contact where accountId In: accs.keySet()];
        
        system.assertEquals(100, count);
        List<account> accs1 = [select id, number_of_contacts__c from account where id in: accs.keyset()];
        
        for (Account acc : accs1) {
            system.assertEquals(10,acc.number_of_contacts__c);
        }
    }
    
    public static Map<Id,Account> createAccounts () {
        List<Account> accs = new List<account> ();
        List<contact> cons = new List<contact> ();
        for (Integer i=0;i<10;i++) {
            Account acc = new Account ();
            acc.name = 'test' + i;
            acc.Number_of_Contacts__c = 0;
            accs.add(acc);
        }
        insert accs;
        for (Account acc : accs) {
            for (Integer i=0;i<accs.size();i++) {
                contact con = new contact();
                con.lastname = 'test' + i;
                con.AccountId = acc.Id;
                cons.add(con);
            }
        }
        insert cons;
        return new map<Id,account>(accs);
    }
    
    //@isTest(seealldata=true) static void testbulk () {
    //    Map<Id,Account> test = new map<Id,account> ([select id from account]);
    //    AccountProcessor.countContacts(test.keyset());
    //}
}