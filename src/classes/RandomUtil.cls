public class RandomUtil {
	//Type class
	//dynamic apex maybe
    public void randomTypeClass () {
        String clsName = 'InkyPinkyPonky';
        Type t = Type.forName(clsName);
        system.debug('' + t.getName());
        
        Type t1 = List<Integer>.class;
        String s = t1.toString();
        System.debug(s);
        
        Type myType =
        Type.forName('MyNamespace', 'ClassName');
        system.debug('' + mytype);
        
        Type t2 = Type.forName('opportunity');
        sobject newObj = 
           (sobject)t2.newInstance();
        system.debug('' + newobj.getsobjectType());
    }
}