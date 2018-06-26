@isTest
public class TestMaxCasesExceededTrigger {
    static testMethod void insertNewUser(){
        Case caseToInsert =  new Case();
        caseToInsert.Status = 'Working';
        caseToInsert.Origin = 'Phone';
        insert caseToInsert;
         Case caseToInsert1 =  new Case();
        caseToInsert1.Status = 'Working';
        caseToInsert1.Origin = 'Phone';
        insert caseToInsert1;
    }
    
}