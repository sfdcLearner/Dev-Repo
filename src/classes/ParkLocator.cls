/**
 * 
 */
public class ParkLocator {
    /**
     * country method gets country code
     * @param  countryName countryName should be country name
     * @return             return array of string
     */
    public static String[] country (String countryName) {
        ParkService.ParksImplPort x = new ParkService.ParksImplPort ();
		return x.byCountry(countryName);
    }
}