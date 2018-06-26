@RestResource(urlMapping='/My_Expense__c/*')
global with sharing class testRest {
    
    @HttpPost
    global static String doPost (String name, String type, String place, String card, Decimal expense) {
        My_Expense__c me = new My_Expense__c();
        me.Name = name;
        me.place__c = place;
        me.type__c = type;
        me.card_Used__c = card;
        me.expense__c = expense;
        insert me;
        return me.Id;
    }
}