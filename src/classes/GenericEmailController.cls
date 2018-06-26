public class GenericEmailController{
    OrgWideEmailAddress owa = [select id, Address from OrgWideEmailAddress];
    List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage(); 

    public void sendNotifications(EmailTemplate et, Id targetId, Id oppId){

        singleMail.setOrgWideEmailAddressId(owa.id);
        singleMail.setTargetObjectId(targetId);
        singleMail.setTemplateId(et.Id);
        singleMail.setsaveAsActivity(false);
        singleMail.setWhatId(oppId);
        email.add(singleMail);
        system.debug('email template>>>' + et);
        try{
        Messaging.sendEmail(email);
    }
        catch(Exception e){system.debug(e);}
    }
}