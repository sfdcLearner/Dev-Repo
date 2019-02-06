@isTest
global class ProjectCalloutServiceMock implements HttpCalloutMock {
   //Implement http mock callout here
    global HTTPResponse respond (HttpRequest request) {
        HTTPResponse response = new HTTPResponse ();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('Created');
        return response;
    }
}