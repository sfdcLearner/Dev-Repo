public class ContactSearch{
    public static List<Contact> searchForContacts(String LastName, String postalCode){
       return [select id, name from Contact where LastName =: LastName AND MailingPostalCode =: postalCode];
    }
}