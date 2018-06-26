public class getSetFun{

public String enteredName;
public String result;

public void runthis(){
    system.debug(ApexPages.currentPage().getParameters().get('id') + '******');
}
public void setresult(string result){
result = this.result;
}

public string getresult(){
    return 'testing';
}
 public string getenteredName(){
return 'Only last name';
}
public void setenteredName(string enteredName){
enteredName = this.enteredName;
}
private ApexPages.StandardController controller;
    public getSetFun(ApexPages.StandardController controller) {
    controller = this.controller;
    runthis();
    }
public void clickButton(){
    getresult();
}

}