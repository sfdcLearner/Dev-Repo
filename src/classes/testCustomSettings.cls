public with sharing class testCustomSettings {
Private ApexPages.StandardController controller;
public boolean flag;
    public testCustomSettings(ApexPages.StandardController controller) {
//    system.debug('flag>>>>>' + getflag());
    this.controller = controller;
    flag = getFlag();
    system.debug('flag>>>>>>'+ flag);
    List<ListCustomSetting__C> test = ListCustomSetting__c.getall().values();
    system.debug('>>>>>>' + test);
    }
    public boolean getFlag(){
        List<ListCustomSetting__C> test = ListCustomSetting__c.getall().values();
        List<User> loggedinUser= [select id, profileId, userRole.name from user where id =: UserInfo.getUserId()];
        List<Profile> userProfile = [select name from profile where id =: loggedinUser[0].profileId];
        system.debug('userid<:>'+ userProfile[0].Name + ' Role<:>' + loggedinUser[0].UserRole.Name);
        for(integer i = 0; i < test.size(); i++){
        system.debug('id<:>'+ test[0].ListField1__C + ' Role<:>' + test[0].Role__C);
            if(test[i].Role__c == loggedinUser[0].userRole.Name && test[i].ListField1__c == userProfile[0].Name){
                return true;
            } 
        }  system.debug('false<:>');
        return false; 
    }
    
}