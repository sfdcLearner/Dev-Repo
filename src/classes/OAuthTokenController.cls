public class OAuthTokenController {

    public OAuthTokenController () { }
    
    public static OAuthToken getOAuthToken () {
        OAuthTokenRetriever__c oauthTokenSettings = OAuthTokenRetriever__c.getInstance('Karthik Dev');
        String body = 'grant_type=password';
        body += '&client_id=' + oauthTokenSettings.ClientId__c;
        body += '&client_secret=' + oauthTokenSettings.ClientSecret__c;
        body += '&username=' + oauthTokenSettings.Username__c;
        body += '&password=' +  oauthTokenSettings.Password__c;

        HttpRequest req = new HttpRequest();
        req.setEndpoint(oauthTokenSettings.Endpoint__c);
        req.setMethod('POST');
        req.setBody(body);
        
        Http h = new Http();        
        HttpResponse res = h.send(req);
        
        String oAuthResponse = res.getBody();
        OAuthToken token = (OAuthToken)JSON.deserialize(oAuthResponse, OAuthToken.class);    
        return token;
    }
            
}