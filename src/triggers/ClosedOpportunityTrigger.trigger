trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
   Set<Id> condSet = new Set<Id>();
   List<Task> upsertTasks = new List<Task> ();
    for(Opportunity o : trigger.new){
        if(o.StageName == 'Closed Won'){
            condSet.add(o.Id);
        }
    }
    for(Opportunity opp : [select id,name from Opportunity where Id IN : condSet]){
        Task t = new Task();
        t.Subject = 'Follow Up Test Task';
        t.WhatId = opp.Id;
        upsertTasks.add(t);
    }
    insert upsertTasks;
}