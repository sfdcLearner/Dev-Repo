@isTest

public class SemdEmailNotificationsTest{
    static testmethod void insertop(){
    List<Opportunity> oppList = new List<Opportunity>();
    oppList = [select id, name, StageName, Closedate from Opportunity Limit 1];
        insert oppList;    
    list<OrgWideEmailAddress> owa = [select id, Address from OrgWideEmailAddress];
        Id owaID = owa[0].Id;
    EmailTemplate et = [select Id, Name from EmailTemplate where name =: 'Opportunity stage change'];
    GenericEmailController gec1 = new GenericEmailController(); 
        gec1.sendNotifications(et,UserInfo.getUserId(),oppList[0].Id);
   
    }
}