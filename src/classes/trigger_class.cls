public class trigger_class{
    
    public static void check_Opp( List<opportunity> ops ){
        Double totalAmount = 0;
//        user UserInfo;
        for( Opportunity o : [select Amount from Opportunity where 
        createdDate = TODAY AND createdbyID =: UserInfo.getUserID()]){
        
        totalAmount += o.Amount;
        
        }
    
        for( Opportunity o2: ops){
            totalAmount += o2.Amount;   
            
            if(totalAmount > 100000)
            o2.addError('you have exceeded daily limit'); 
        }
    }
    
}