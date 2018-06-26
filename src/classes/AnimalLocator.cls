public class AnimalLocator {
    public static String getAnimalNameById (Integer Idee) {
        Http h = new Http ();
        HttpRequest request = new HttpRequest ();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + string.valueof(idee));
        request.setMethod('GET');
        HttpResponse response = h.send(request);
        Map<string,object> animal;
        if (response.getStatusCode() == 200) {
            Map<string,object> results = (Map<string,object>) JSON.deserializeUntyped(response.getBody());
            animal = (Map<String,object>) results.get('animal');
        }
        return (String)animal.get('name');
    }
}