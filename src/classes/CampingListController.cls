public with sharing class CampingListController {
    @AuraEnabled
    public static List<Camping_item__c> getItems () {
        /*
        // Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[] {
            'Id', 'Name', 'Packed__c', 'Quantity__c', 'Price__c'
        };
        
        Map<String,Schema.SObjectField> fieldDescribeTokens = 
            Schema.SObjectType.Expense__c.fields.getMap();
        
        for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
            }
        }
        */
        // OK, they're cool, let 'em through
        return [SELECT Id, Name, Packed__c, price__c, quantity__c
                FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem (Camping_Item__c item) {
        // Perform isUpdatable() checking first, then
        upsert Item;
        return Item;
    }
}