global class DailyLeadProcessor implements Schedulable {
    global void execute (SchedulableContext sc) {
        List<Lead> leads = [select id, leadsource from lead where leadsource='' limit 200];
        if (leads.size() > 0) {
            for (lead l : leads) {
            	l.leadsource = 'Dreamforce';
        	}
            update leads;
        }
    }
}