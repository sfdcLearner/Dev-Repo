public class ProjectCalloutService {
    //Complete the implementation for business and callout logic
	@InvocableMethod 
    public static void postOpportunityToPMS (List<Id> oppId) {
        List<Opportunity> opps = [SELECT ID, Name, Account.Name, CloseDate, Amount FROM Opportunity where ID IN: oppId];
        String json = '';
        for (opportunity opp : opps) {
            json += buildJson(opp);
        }
        system.debug('json++' + json);
        
        HttpRequest req = getRequest(json);
        system.debug('req++=' + req);
        
        doPOST(req);
    }
    
    public static String buildJson (Opportunity opp) {
        String json ='{';
        json += '\"opportunityId\": \"' + opp.Id + '\",';
        json += '\"opportunityName\": \"' + opp.Name + '\",';
        json += '\"accountName\": \"' + opp.Account.Name + '\",';
        String closedate = String.valueOf(opp.CloseDate).left(10);
        json += '\"closeDate\": \"' + closeDate + '\",';
        json += '\"amount\": ' + opp.Amount + '}';
        return json;
    }
    
    public static HttpRequest getRequest (String body) {
        HttpRequest req = new HttpRequest ();
        req.setEndpoint('callout:ProjectService');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json;charset=UTF-8');
        ServiceTokens__c token = ServiceTokens__c.getInstance('ProjectServiceToken');
        req.setHeader('token', token.Token__c);
        req.setBody(body);
        return req;
    }
    
    public static void doPOST (HttpRequest req) {
		Http http = new Http ();
        HttpResponse res = http.send(req);
        System.debug('Response++' + res.getBody());
    }
    
    public Class QueueablePMSCall implements System.Queueable, Database.AllowsCallouts {
        List<Id> oppIds = new List<Id> ();
        public QueueablePMSCall (ID oppId) {
        	this.oppIds.add(oppId);
        }
        
        public void execute (QueueableContext context) {
            postOpportunityToPMS(oppIds);
        }
    }
}