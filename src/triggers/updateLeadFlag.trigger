trigger updateLeadFlag on Lead (after update, after insert) {
opportunity opp = new opportunity();
Account acc = new account();
Lead currentLead = new Lead();
    for(Lead lead : Trigger.new){
        currentLead = [select id, isConverted, convertedOpportunityId, convertedAccountId from Lead where id =: lead.id];
        if(currentLead.isConverted == true){            
            opp = [select id, Lead_Flag__c from opportunity where id =: currentLead.convertedOpportunityId];            
            opp.lead_flag__c = true;
            acc = [select id, Lead_Flag__c from Account where id =: currentlead.convertedAccountId];
            acc.Lead_Flag__c = true;
        }
        update opp;
        update acc;
    }       
}