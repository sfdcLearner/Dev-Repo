public class Randomizer {
    /*public static integer min {get; set;}
    public static integer max {get; set;}
    public static integer excludeDigit {get; set;}
    */
    public Randomizer () {}
    
    /*public Randomizer (integer min, integer max) {
        min = min;
        max = max;
        //this.super();
    }*/
    
    public static integer getCustomRandomNumber (integer min, integer max) {
        return getCustomRandomNumber(min, max, new set<Integer> {10});
    }
    
    public static integer getCustomRandomNumber (integer min, integer max, Set<integer> excludeDigits) {
        Integer tempRandomNumber = getRandomNumber();
        while (!(tempRandomNumber >= min && tempRandomNumber <= max) || excludeDigits.contains(tempRandomNumber)) {
            tempRandomNumber = getRandomNumber();
        }
        return tempRandomNumber;
    }
    
    public static integer getRandomNumber () {
        return (Integer) (Math.random() * 10);
    }
    
    public class InputStringProperties {
        String inputString {get; set;}
        Integer stringLength {get; set;}
        Integer vowels {get; set;}
        Integer consonants {get; set;}
        
        public InputStringProperties (String InputText) {
            calcNumberofVowels ();
        }
        
        public void calcNumberOfVowels () {
            //for ()
        }
    }
}