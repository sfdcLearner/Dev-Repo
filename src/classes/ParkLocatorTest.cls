@isTest
public class ParkLocatorTest {
    @isTest static void testCallOut () {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
		String x = 'India';
        String[] result = ParkLocator.country(x);
    }
}