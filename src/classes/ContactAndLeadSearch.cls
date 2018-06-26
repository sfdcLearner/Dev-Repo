public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads (String incomingString) {
        insert new Lead (lastname='Smith',company='test');
        insert new contact (lastname='Smith');
        
        return new List<List< SObject>> ([Find :incomingString in all fields returning Lead(firstname,lastname), contact(firstname,lastname)]);
    }
}