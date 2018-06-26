trigger SetMasterParent on Account (before update) {
    Set<Id> accIds = new Set<Id>();
    for(Account acc: trigger.new) {
        accIds.add(acc.id);
    }
    List<Account> accounts = [select id, parent.id, Master_Parent__c, accountnumber from account where id In: accIds];
    system.debug('<:>' + accIds);
    for(Account account : accounts) {
        system.debug('<:><:>' + accIds);
        if(account.parent.id == null || account.parent.id == '') {
        system.debug('<:><:>' + accIds);
        //account.master_parent__c = account.id;
        account.accountNumber = '1213';
        }
    }
}