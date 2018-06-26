@IsTest
public class TestForceForcaaasting {

    static testmethod void insertUser() {
    
        User u = new User();
        
        u.FirstName = 'Pratik';
        u.LastName = 'Jannela';
        u.Email = 'pratik.j@gmail.com';
        u.Alias = 'keekoo';
        u.Username ='pratik@sfdc.com';
        u.ProfileID = '00e900000013oVy';
        
        u.TimezoneSidKey = 'America/Denver';
        u.LocaleSidKey = 'en_US';
        u.EmailEncodingKey = 'UTF-8';
        u.LanguageLocaleKey = 'en_US';
        
        insert u;
        
        }
 
 }