@isTest 
private class WarehouseCalloutServiceTest {
  // implement your mock callout test here
    @isTest static void testGetCallout () {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock ());
        
        Test.startTest();
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        List<Product2> insertedProducts = [SELECT id, Name, Maintenance_Cycle__c FROM Product2];
        system.debug('insertedProducts' + insertedProducts);
        system.assertEquals('fake', insertedProducts[0].Name);
        system.assertEquals(99,insertedProducts[0].Maintenance_Cycle__c);
    }
    
    @isTest static void testSchedulemethod () {
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        Date closeDate = Date.today().addDays(-7);
        string jobId = System.schedule('ScheduledApexTest', CRON_EXP, new WarehouseSyncSchedule());
        system.assertNotEquals(jobId, '');
    }
}