@isTest
global class WarehouseCalloutServiceMock implements HttpCalloutMock {
    // implement http mock callout
    global HTTPResponse respond (HTTPRequest request) {
        HTTPResponse response = new HTTPResponse ();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"_id":"55d66226726b611100aaf741","replacement":false,"quantity":5,"name":"Fake","maintenanceperiod":99,"lifespan":99,"cost":99,"sku":"100003"},{"_id":"55d66226726b611100aaf742","replacement":true,"quantity":183,"name":"fake2","maintenanceperiod":0,"lifespan":0,"cost":300,"sku":"100004"}]');
        response.setStatusCode(200);
        return response; 
    }
}