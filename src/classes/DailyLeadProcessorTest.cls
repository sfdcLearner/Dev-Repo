@isTest
public class DailyLeadProcessorTest {
	@testSetup
    public static void setup () {
        List<Lead> leads = new List<lead> ();
        for (Integer i=0;i<200;i++) {
            leads.add(new lead(lastName='test'+i,company='test co.',leadsource=''));
        }
        insert leads;
    }
    @isTest Static void leadprocessTest () {
        String chron = '0 0 0 15 3 ? 2022';
        Test.startTest();
        system.debug(Limits.getCpuTime()+ '+++');
        System.Schedule('Daily Lead Process',chron, new DailyLeadProcessor());
        system.debug(Limits.getCpuTime());
        system.assertEquals(0, [select count() from lead where leadsource='Dreamforce']);
        Test.stopTest();
        system.assertEquals(200,[select count() from lead where leadsource='Dreamforce']);
    }
}