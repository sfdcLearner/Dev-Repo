public with sharing class checkBoxLeadExtension{
public boolean check1{get; set;}
public boolean check2{get; set;}
public boolean check3{get; set;}
public boolean select1{get; set;}
public boolean select2{get; set;}
public boolean select3{get; set;}
public boolean subSelect1{get; set;}
public boolean subSelect2{get; set;}
public boolean subSelect3{get; set;}
public String message{get; set;}

public Id leadId;
public Lead lead;
public Event event;
Private ApexPages.StandardController controller;
    public checkBoxLeadExtension(ApexPages.StandardController controller) {
        this.controller = controller;
        leadId = controller.getId();
        check1 = check2 = check3 = true;
        select1 = false;
        select2 = false;
        select3 = false;
    }
    public void reset1(){
       if(select1 == true){ 
           check2 = check3 = select2 = select3 = false; 
       }else{
           check3 = check2 = true;
       }
    }
    public void reset2(){
        if(select2 == true){
            check1 = check3 = select1 = select3 = false;                
        }else{
            check1 = check3 = true;
        }
    }
    public void reset3(){
        if(select3 == true){
            check2 = check1 = select2 = select1 = false;    
        }else{
            check2 = check1 = true;
            }
    }    
    public void validateProposal(){
        if(subSelect1){}
    }
    
    public PageReference saveActivity(){
        if((subSelect1 == true && (subSelect2 == true || subselect3 == true) ) ||
           subSelect1 == false && (subSelect2 == true && subselect3 == true) ){
              message = 'Please select only one option under Proposal';             
               //ExceptionUtil.addPageErrorMessage('Please select only one option under Proposal');
           } 
           else{
            if(check1 == true){
                saveLeadActivity('Cold Call','');
            }        
        return controller.view();
        } return null;
    }
    public void saveLeadActivity(String action, String subAction){
        event.whatId = leadId;
        event.ownerId = UserInfo.getUserId();
        if(subAction != ''){
            event.Subject = action;            
        }else{
            event.Subject = action + ' - ' + subAction;
        }
        insert event;
    }
}