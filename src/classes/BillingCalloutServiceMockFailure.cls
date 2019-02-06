@isTest
Global class BillingCalloutServiceMockFailure implements HttpCalloutMock {
   //Implement http mock callout failure here 
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse ();
        response.setBody('Error creating a Project Invoice. Please try again');
        response.setHeader('Content-Type', 'application/json');
        return new HttpResponse ();
    }
}