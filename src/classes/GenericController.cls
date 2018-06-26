public class GenericController{
   
    OrgWideEmailAddress owa = [select id, Address from OrgWideEmailAddress];
    List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();

    public static void OpportunityAfterInsert(List<Opportunity> newOpportunities, Map<Id,Opportunity> newMap) {
        System.debug('new oportunities>>>'+ newOpportunities); 
        GenericController.sendNotificationsToPMSDM(newOpportunities, newMap);
        //GenericController.updateMainCompetitors(newOpportunities);
    }
    public static void OpportunityAfterUpdate(List<Opportunity> newOpportunities, List<Opportunity> oldOpportunities, Map<Id,Opportunity> newMap, Map<Id,Opportunity> oldMap){
    	System.debug('new oportunities update::>>>>'+ newOpportunities); 
    	List<Opportunity> pmSdmList = new List<Opportunity>();
    	List<Opportunity> updateExRevList = new List<Opportunity>();
    	
    	for(Opportunity o : newOpportunities){
    		System.debug('old stage>>>'+ oldMap.get(o.Id).StageName +'<<< new stage>>>' + o.StageName); 
    		System.debug('old amount>>>'+ oldMap.get(o.Id).Amount + '<<< new amount>>>' + o.Amount );
    		
    		if(oldMap.get(o.Id).StageName != o.StageName || oldMap.get(o.Id).Amount != o.Amount){
	     		pmSdmList.add(o);  
	     	}
			//if(oldMap.get(o.Id).ExpectedRevenue != newMap.get(o.Id).ExpectedRevenue){
			//	updateExRevList.add(o);
			//}    
		}
		if(pmSdmList.size() > 0){
			GenericController.sendNotificationsToPMSDM(pmSdmList,newMap);
		}
		//if(updateExRevList.size() > 0){
		//	List<Opportunity> returnedList = GenericController.updateMainCompetitors(updateExRevList);
		//	if(returnedList.size() > 0){system.debug('returned update list>>>' + returnedList);}
		//	update returnedList;
		//}		
    }
   
    public static void sendNotificationsToPMSDM(List<Opportunity> newOpportunities, Map<Id,Opportunity> newMap){
    	Map<Id,Opportunity> oppMap= new Map<Id,Opportunity>();
    	List<Opportunity> oppList =  new List<Opportunity>();
    	EmailTemplate emailTemplate = [select Id, Name from EmailTemplate where name =: 'Opportunity stage change'];
    	System.debug('email templete>>>'+ emailTemplate);
    	oppList = [select Id, Name, ExpectedRevenue, CreatedByID From Opportunity where ExpectedRevenue > 1000 And Id IN: newMap.keyset()];
    	//for(Opportunity opp : newOpportunities){
    	//	if(opp.ExpectedRevenue > 1000){
    	//		oppList.add(opp);
    	//		oppMap.put(opp.Id,opp);		
    	//		}
    	//}
    	if(oppList.size()>0){
    		sendNotifications(emailTemplate,newMap,oppList);
    	}
    }
    
    public static void sendNotifications(EmailTemplate et, Map<Id,Opportunity> oppMap, List<Opportunity> oppList){

    OrgWideEmailAddress owa = [select id, Address from OrgWideEmailAddress];
    List<Messaging.SingleEmailMessage> email = new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage(); 
    singleMail.setOrgWideEmailAddressId(owa.id);
    System.debug('owa id>>>'+ owa.id);
    singleMail.setTemplateId(et.Id);
    singleMail.setsaveAsActivity(false);

    	for(Opportunity o : oppList){
    		singleMail.setTargetObjectId(o.CreatedByID);
    		System.debug('CreatedByID>>>'+ oppMap.get(o.Id).CreatedByID);
    		singleMail.setWhatId(o.Id);
    		System.debug('WhatID>>>'+ o.Id); 
    		email.add(singleMail);
    		System.debug('email>>>'+ email); 
    		Messaging.sendEmail(email);
    	}	
   }

   //public static List<Opportunity> updateMainCompetitors(List<Opportunity> OppList){
   //     List<Opportunity> updateOppList = new List<Opportunity>();
   //     for(Opportunity o : oppList){	
   //     	if(o.ExpectedRevenue > 10000){
	  //     		Opportunity op = new Opportunity();
	  //     		op.MainCompetitors__c = 'Nobody'; 
	  //     		op.Id = o.Id;
   //     		updateOppList.add(o);		
   //     	}	
   //     }
   //     return updateOppList;
   // }
}