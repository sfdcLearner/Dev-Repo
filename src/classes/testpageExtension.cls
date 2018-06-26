public with sharing class testpageExtension {
public boolean check{get;set;}
public string link{get;set;}
    public testpageExtension(ApexPages.StandardController controller) {
        link = URL.getSalesforceBaseURL().toExternalForm();
        check = true;
    }

}