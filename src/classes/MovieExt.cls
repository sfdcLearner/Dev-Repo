public with sharing class MovieExt {
public Movie__c movie {get; set;}
public Movie__c newmovie {get; set;}
public Id movieId {get; set;}
public static ApexPages.Action testAction = new ApexPages.Action ('testing');
    
    public MovieExt(ApexPages.StandardController controller) {
        this.movie = (Movie__c)controller.getrecord();
        movieId = movie.Id;
        newmovie = new Movie__c ();
    }
    public List<Schema.FieldSetMember> getFields1 () {
        return Schema.SObjectType.Movie__c.FieldSets.Movie_Fieldset1.getFields();
    }
    
    public Movie__c getDisplayFields1 () {
        String query = 'SELECT ';
        for (Schema.FieldSetMember f : this.getFields1()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM Movie__c WHERE Id = :movieId';
        return Database.query(query);
    }
    
    public integer testing () {
        return 2;
    }
}