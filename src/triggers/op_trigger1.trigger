trigger op_trigger1 on Opportunity (before insert) {
     trigger_class.check_opp(Trigger.new);   
}