public class SyncOrgData {
    
    public SyncOrgData () {}
    
    public static void createAccount () {
      
        HttpRequest req = getRequest();
            
        Http h = new Http ();
        HttpResponse res = h.send(req);
        string response = res.getbody();
        //sobject obj = (sobject) json.deserialize(response, sobject.Class);
        system.debug('+++response+++' + response );
    }
    
    public static HttpRequest getRequest () {
        OauthToken token = oAuthTokenController.getOAuthToken();
        
        HttpRequest req = new HttpRequest ();        
            req.setEndpoint(token.instance_url + '/services/data/v37.0/sobjects/Account/');
            req.setMethod('POST');
            req.setBody(getbody());
            req.setHeader('Authorization', 'OAuth ' + token.access_token);
            req.setHeader('Content-Type', 'application/json');
        
        return req;
    }
    
    public static string getBody () {
        String jsonbody = '{"Name":"Test3", "site":"test site3"}';
        return jsonBody;
    }
    
    public class responseClass {
        Id id {get;set;}
        String errors {get;set;}
        Boolean success {get;set;}
        
    }
}