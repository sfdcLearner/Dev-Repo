public class AddPrimaryContact implements Queueable {
    public Contact contact;
    public string state;
    
    public AddPrimaryContact (Contact con, String state) {
        this.contact = con;
        this.state = state;
    }
    
    public void execute (QueueableContext context) {
        List<Account> accounts = [select id, name, (select Id,firstname,lastname from contacts) from account where billingstate =: state limit 200];
        List<Contact> contactsToInsert = new List<Contact> ();
        if (accounts.size() > 0) 
            for (Account account : accounts) {
                Contact clonedContact = contact.clone(false,false,false,false);
                clonedContact.AccountId = account.Id;
                contactsToInsert.add(clonedContact);
            }
        	insert contactsToInsert;
    }
}