trigger BirthdateNeede on Contact (before insert,before update) {

	String lastName = '';
	for(Contact con: Trigger.new){
		if(con.LastName == 'jannela' && con.Birthdate == null)
			con.addError('Birth date is needed');
		}

}