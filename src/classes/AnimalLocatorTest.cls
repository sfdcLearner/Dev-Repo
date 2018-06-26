@isTest
public class AnimalLocatorTest {
    @isTest static void testGet () {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String animalName = AnimalLocator.getAnimalNameById(2);
        system.assertEquals(animalName, 'bear');
    }
}