trigger CreatePraBluMeter on Movie__c (after insert) {
    set<Id> newMovieIds = Trigger.newMap.keyset();
    List<Pra_Blu_Meter__c> newPrabluRecords = new List<Pra_Blu_Meter__c> ();
    List<Movie__c> newMovies = new List<Movie__c> ();
    for (Id movieId : newMovieIds) {
        Pra_Blu_Meter__c newRecord = new Pra_Blu_Meter__c (Movie__c=movieId);
        newPrabluRecords.add(newRecord);
    }
    insert newPrabluRecords;
    for (Pra_Blu_Meter__c newRecord : newPrabluRecords) {
        Movie__c newMovie = new Movie__c(Id=newRecord.Movie__c,Pra_Blu_Meter_Record__c=newRecord.Id );
        newMovies.add(newMovie);
    }
    update newMovies;
}