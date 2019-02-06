@isTest
Global class BillingCalloutServiceMock implements HttpCalloutMock{
   //Implement http mock callout here
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse ();
        response.setBody('Billed');
        response.setHeader('Content-Type', 'application/json');
        return new HttpResponse ();
    }
}