trigger SetInterest on Opportunity (before insert, before update) {

    for(Opportunity opp : trigger.new) {
        if(opp.Amount > 99 && opp.StageName == 'Prospecting') opp.Interest__c = 10.00;
    }
}