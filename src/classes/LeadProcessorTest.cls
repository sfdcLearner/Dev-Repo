@isTest 
public class LeadProcessorTest {
    @isTest static void myUnitTest () {
        Test.startTest();
        Database.executeBatch(new LeadProcessor (), 200);
        Test.stopTest();
        Integer leadsize = [select count() from lead where leadsource='Dreamforce'];
        system.assertEquals(leadsize, 200);
    }
    
    @testSetup
    static void setup () {
        List<Lead> leads = new List<Lead> ();
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead (company='test'+i,lastname='test'+i));
        }
        insert leads;
    }
}