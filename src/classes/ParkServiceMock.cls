@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke (Object stub,
                           Object request,
                           Map<String, Object> response,
                           String endpoint,
                           String soapAction,
                           String requestName,
                           String responseNS,
                           String responseName,
                           String responseType) {
    	ParkService.byCountryResponse x = new Parkservice.byCountryResponse ();
                               x.return_x = new string[] {'Anamudi Shola National Park', 'Anshi National Park', 'Bandipur National Park'};
	}
}