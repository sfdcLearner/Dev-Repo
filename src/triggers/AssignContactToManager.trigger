trigger AssignContactToManager on Contact (after insert) {
    //List <Contact> conList = new List<Contact>();
  //    conList = [Select Id,Name from Contact where Email !=''];
    ///*for(Contact con: Trigger.new){
    //  con.Owner = con.CreatedBy.Manager; 
    //      }*/
    ////System.debug('>>> conId'+ conList.Id);      
    //Set<Contact> conSet = new Set<Contact>();
    //for(Contact c: Trigger.new){
    //  Contact con = new Contact();
    //  con.Id = con.Id;
    //  conSet.add(c);
    //}
List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();
for(Contact c : Trigger.new){
    Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
                String body = 'A new case for NA Mass Serviceability Check has been assigned to you.';
                body += '<br>';
                body += 'Phone Number:' + c.Phone;
                body += '<br>';
                body += 'https://login.salesforce.com/' + c.Id;
                body += '<br>';
                body += 'Thanks!'; 
                singleMail.setHtmlBody(body);
                //String myEmail= 'pratik.jannela@charter.com';
                //singleMail.setCcAddresses(myEmail);
                singleMail.setTargetObjectId(c.OwnerId);
                singleMail.setReplyTo('pratik.jannela@gmail.com');
                singleMail.setSubject('A NEW CASE HAS BEEN ASSIGNED TO YOU');
                //singleMail.setTemplateId(emailTemp.Id);
                singleMail.setSaveAsActivity(false);
                email.add(singleMail);
                
            }
    Messaging.sendEmail(email);
}