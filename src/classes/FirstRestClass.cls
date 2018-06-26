@RestResource(urlMapping = '/FirstRest/*')
global class FirstRestClass {
    public String status {get; set;}
    public List<sObject> data {get; set;}
    public String message {get; set;}
    public String errorCode {get; set;}
    
    global static boolean isNotNullOrEmpty(string str) {
        return str != null || !String.isBlank(str);
    }
}