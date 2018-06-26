public class AccountHandler {
    public static account insertNewAccount (String name) {
        account acc;
        try {
            acc = new Account(name=name);
            insert acc;
        } catch (Exception e) {
            return null;
        }
        return acc;
    }
}