public class StringArrayTest {
    public static List<String> generateStringArray (Integer n) {
        List<string> returnList = new List<String> ();
        for (Integer i=0;i<n;i++) {
            returnList.add('Test ' + i);
        }
        return returnList;
    }
}