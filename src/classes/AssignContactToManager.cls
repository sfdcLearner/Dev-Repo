@isTest
public class AssignContactToManager{
    static testMethod void insertNewContact(){

        Contact contactToCreate = new Contact();
        contactToCreate.LastName = 'TestContact';
        contactToCreate.Phone = '6626174765';

        insert contactToCreate;
    }
}