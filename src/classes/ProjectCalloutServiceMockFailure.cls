@isTest
global class ProjectCalloutServiceMockFailure {
   //Implement http mock callout failure here 
    global HttpResponse respond (HttpRequest request) {
        HTTPResponse response = new HTTPResponse ();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('Access Denied');
        return response;
    }
}