trigger SendEmails on Opportunity (before insert, before update,after insert, after update,before delete, after delete, after undelete) {

    if(trigger.isAfter){
        if(trigger.isInsert){
            GenericController.OpportunityAfterInsert(trigger.new, trigger.newMap);
            
        }
        if(trigger.isUpdate){
            GenericController.OpportunityAfterUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        }
    }
}