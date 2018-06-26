@IsTest
public class TestUserNickname {

    static testmethod void insertUser() {
    
        user u = new user();
        
        u.FirstName = 'Rooney' ;
        u.LastName = 'Jannela' ;
        u.Email = 'rooney@jannela.com' ;
        u.Alias = 'theking' ;
        u.Username = 'rooney@jannela.com' ;
        u.ProfileId = '00e90000000PGhP';
        
        u.TimeZoneSidKey = 'America/Denver' ;
        u.LocaleSidKey = 'en_US' ;
        u.EmailEncodingKey = 'UTF-8' ;
        U.LanguageLocaleKey = 'en_US' ;
        
        insert u ;
    
    }

}