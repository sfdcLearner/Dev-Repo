global class TestService {
    global class AccountContactWrapper {
        global Account account;
        global list<contact> contacts;
    }
    
    webService static AccountContactWrapper getAccountandContacts (Id acId) {
        List<Account> acc = [select id, (select id from contacts) from account where id =:acId];
        AccountContactWrapper acw = new AccountContactWrapper ();
        acw.account = acc[0];
        acw.contacts = acc[0].contacts;
        return acw;
    }
}