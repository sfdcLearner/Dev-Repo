public class MaintenanceRequestHelper {
    public static Set<Id> triggerRunOnce = new SEt<Id> ();
    public static void updateWorkOrders (Map<Id,Case> caseMap, Boolean isAfter) {
        // update workorders
        Map<Id,case> casestoInsert = new Map<Id,case> ();
        
        Map<Id, Work_part__c> relatedWP = new Map<Id, Work_part__c>(
            														[select id, equipment__r.maintenance_cycle__c, Maintenance_request__c 
                                                                     from work_part__c where Maintenance_Request__c In: caseMap.keySet()]);
        
        List<AggregateResult> ars = [select count(id) c, min(equipment__r.maintenance_cycle__c) m, Maintenance_Request__c 
                                     from work_part__c where Maintenance_Request__c In: caseMap.keySet() group by Maintenance_Request__c];

        Map<Id,AggregateResult> aggregateResultMap = new Map<Id,AggregateResult> ();
        for (aggregateResult ar : ars) {
            aggregateResultMap.put((Id)ar.get('Maintenance_Request__c'), ar);
        }
        if (!isafter) {
            for (Case tcase : caseMap.values()) {
                if (tcase.status == 'closed' && 
                        (tcase.type == 'Repair' || tcase.type == 'Routine Maintenance') && !casesToInsert.keySet().contains(tcase.Id)) {
                    case newcase = tcase.clone();
                    newCase.Subject = (tcase.Subject != '' || tcase.Subject != null) ? tcase.Subject : 'Routine Maintenance - ' + tcase.Id;
                    newCase.Status = 'Open';
                    newCase.type = 'Routine Maintenance';
                    newCase.Date_Reported__c = System.today();
                    newCase.Vehicle__c = tcase.Vehicle__c;
                    newCase.Equipment__c = tcase.Equipment__c;
                    //Integer maintenanceCycle = (Integer)aggregateResultMap.get(tcase.Id).get('m');
                    //newCase.Date_Due__c = System.Today().addDays(maintenanceCycle);
                    casestoInsert.put(tcase.Id,newCase);
                }
            }
                insert casestoInsert.values();
        }
        /*system.debug('casestoInsert' + casestoInsert + trigger.isAfter);
        if (casestoInsert.size() > 0) {
            for (Work_Part__c wp : relatedWP.values()) { system.
                wp.Maintenance_Request__c = casesToInsert.get(wp.Maintenance_Request__c).Id;
            }
            update relatedWP.values();
        }*/
    }        
    
}