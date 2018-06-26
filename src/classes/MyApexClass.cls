public class MyApexClass {
    SampleAccount__c s = new SampleAccount__c();
    public List<Account> accList {get;set;}
    public List<Contact> conList {get;set;}
    public MyApexClass() {
            accList = [SELECT id, name FROM Account Limit 5];
            System.debug('Test-1::>');
    }

    public List<Account> getaccList(){
        accList = [SELECT id, name FROM Account Limit 5];
        System.debug('Test-2::>');
        return accList;
    }
    public PageReference getMore(){
        pagereference p = apexpages.Currentpage();
        p.setredirect(true);
        return p; 
    }
     public List<Contact> getconList(){
        conList = [SELECT id,name FROM Contact Limit 5];
        System.debug('Test-3::>');
        return conList;
    }
}