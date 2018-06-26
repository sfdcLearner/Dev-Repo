public class AccountProcessor {
    @future
    public static void countContacts (Set<Id> accountIds) {
        if (accountIds.size() < 50000 && accountIds.size() > 0) {
            List<AggregateResult> ars = [select count(Id) c, accountId from contact where accountId In: accountIds group by accountId];
            Map<Id,Integer> contactCountMap = new Map<Id,Integer> ();
            for (Aggregateresult ar : ars) {
                contactCountMap.put((Id)ar.get('accountId'), (Integer) ar.get('c'));
            }
            List<account> accounts = [select id, Number_of_Contacts__c from account where id In: accountIds];
            for (Account ac : accounts) {
                ac.Number_of_Contacts__c = contactCountMap.get(ac.Id);
            }
            update accounts;
        }
    }
}