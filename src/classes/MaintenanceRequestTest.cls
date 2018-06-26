@isTest
public class MaintenanceRequestTest {
    @testSetup
    static void setup () {
        Vehicle__c vehicle = new Vehicle__c(Name='*Tester*');
		insert vehicle;
        Product2 equipment = new Product2();
        equipment.Name='*TestEquip*';
        equipment.Cost__c = 100;
        equipment.Current_Inventory__c = 1;
        equipment.Lifespan_Months__c = 1;
        equipment.Maintenance_Cycle__c = 30;
        //equipment.Warehouse_SKU__c = '#grubsareyummy';
        equipment.IsActive = true;
        insert equipment;
        case c2 = new Case ();
        c2.Subject = vehicle.Name;
        c2.Vehicle__c = vehicle.Id;
        c2.Status = 'Open';
        c2.Type = 'Routine Maintenance';
        c2.Equipment__c = equipment.Id;
        c2.Date_Reported__c = System.today();
        insert c2;
        Work_Part__c part = new work_part__c ();
        part.Maintenance_Request__c = c2.Id;
        part.Quantity__c = 1;
        insert part;
    }
    
    @isTest static void unitTest () {
        case tCase = [select id, subject, status, Equipment__c from case where subject='*Tester*'];
        tcase.Status = 'closed';
        update tcase;
        List<Case> newcase = [select id, status, subject, vehicle__c, Equipment__c, type from case where subject = '*Tester*' and status = 'Open'];
        system.assertequals(newcase.size(),1);
        system.assertEquals('Routine Maintenance', newcase[0].type);
        system.assertEquals(newcase[0].Equipment__c, tcase.Equipment__c);
    }
    
    @isTest static void bulkTest () {
        
    }
}