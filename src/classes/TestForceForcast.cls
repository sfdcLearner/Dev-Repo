@IsTest
public class TestForceForcast {
    
    static testmethod void insertUser() {
    
        User u = new User();
        
        u.FirstName = 'aaaa';
        u.LastName = 'bbbb';
        u.Email = 'aaa.bbb@gma.com';
        u.Alias = 'abab';
        u.Username = 'aaa.bbb@gma.com';
        // enter all required fields.....
        insert u;
    }
}