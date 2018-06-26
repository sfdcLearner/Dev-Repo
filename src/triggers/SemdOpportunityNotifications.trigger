trigger SemdOpportunityNotifications on Opportunity (before update, after update, before insert, after insert, before delete, after delete, after undelete) {
    EmailTemplate emailTemplate = new EmailTemplate();
    List<Opportunity> oppList = new List<Opportunity>();
    Id ownerID; 
    for(Opportunity o : trigger.new){
            Opportunity op = new Opportunity();
            op.Id = o.Id;
            op.Name = o.Name;
            oppList.add(op);
            ownerID = UserInfo.getUserId();
            system.debug('created by id >>>' + UserInfo.getUserId());
    }
    if(trigger.isAfter){
        emailTemplate = [select Id, Name from EmailTemplate where name =: 'Opportunity stage change'];
        GenericEmailController gec = new GenericEmailController(); 
        gec.sendNotifications(emailTemplate,ownerID,oppList[0].Id);

    }
}