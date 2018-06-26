public with sharing class WordJumbler {
    /* Properties */
    public ApexPages.standardController controller;
    public String inputText {get; set;}
    public Set<String> randomStrings {get; set;}
    /* End */
    
    /* Constructors */
    public WordJumbler() {

    }
    
    public WordJumbler (ApexPages.standardController controller) {
        this.controller = controller;
    }
    /* End */
    
    /* Actions */
    public pageReference submit () {
        Set<Integer> excludeDigits = new Set<Integer> ();
        //String[] InputChars = inputText.split('');
        List<String> InputCharList = inputText.split('');
        for (Integer i=0;i<inputText.length();i++) {
            String newText = InputCharList[i];
            excludeDigits.add(i);
            for (integer j=0;j<inputText.length()-1;j++) {
                integer randomIndex = Randomizer.getCustomRandomNumber(0,inputText.length(),excludeDigits);
                excludeDigits.add(i);
                newText += InputCharList[i];
            }
            randomStrings.add(newText);
        }
        return null;
    }
    /* End */
	
    public static Set<String> getRandomStrings (String inputText) {
        Set<String> randomStrings = new Set<String> ();
        Set<Integer> excludeDigits = new Set<Integer> ();
        List<String> InputCharList = inputText.split('');
        
        for (Integer i=0;i<inputText.length();i++) {
            String newText = InputCharList[i];
            excludeDigits.add(i);
            for (integer j=0;j<inputText.length()-1;j++) {
                integer randomIndex = Randomizer.getCustomRandomNumber(0,inputText.length()-1,excludeDigits);
                System.Debug('+++' + randomIndex);                
                excludeDigits.add(i);
                newText += InputCharList[i];
            }
            System.debug('===' + excludeDigits);
            randomStrings.add(newText);
        }
        return randomStrings;
    }
}