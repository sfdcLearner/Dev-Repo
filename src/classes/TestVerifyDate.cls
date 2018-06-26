@isTest
public class TestVerifyDate{
    @isTest static void testCheckDates(){
        Date date1 = Date.newInstance(1991, 4, 27);
        Date date2 = Date.newInstance(1986, 7, 12);
        Date returnedDate = VerifyDate.CheckDates(date1, date2);
        date2 = Date.newInstance(1991, 5, 25);
        Date retrunedDate2 = VerifyDate.CheckDates(date1, date2);
    }
}