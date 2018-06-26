public with sharing class contactController {
    public List<Contact> contactList {get;set;}
    public contactController() {
        
    }
    //public void setcontactList()
    //{
    //  contactList=[SELECT AccountId, AssistantName, Birthdate, Fax, Id FROM Contact];
    //}
    public List<Contact> getcontactList()
    {   
        List<Contact> cList = new List<Contact>();
        cList=[SELECT AccountId, AssistantName, Birthdate, Fax, Id ,Name FROM Contact];
        system.debug('>>>');
        return cList;
    }
}