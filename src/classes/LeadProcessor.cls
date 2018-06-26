global class LeadProcessor implements Database.Batchable<sObject>, Database.stateful {
    global Database.QueryLocator start (Database.BatchableContext bc) {
        return Database.getQueryLocator('select id, LeadSource from lead');
    }
    global void execute (Database.BatchableContext bc, List<Lead> scope) {
        for (Lead ld : scope) {
            ld.leadsource = 'Dreamforce';
        }
        update scope;
    }
    global void finish (Database.BatchableContext bc) {}
}