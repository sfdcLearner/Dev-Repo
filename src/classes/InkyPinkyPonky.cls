public class InkyPinkyPonky {

    public InkyPinkyPonky() {

    }

	private static final Blob tvsVictor = Blob.valueOf('Inky Pinky Ponky');
    private static final Blob thaalam = Crypto.generateAesKey(128);
    private static final string vaaduka = 'AES128';
    
    public static String getPonky (String x) {
        Inkypinkyponky__c ipp = Inkypinkyponky__c.getInstance(x);
        blob michael = EncodingUtil.base64Decode(ipp.ponky__c);
        Blob madhan = EncodingUtil.base64Decode(ipp.pinky__c);
        Blob kamaraj = crypto.decrypt(vaaduka, michael, tvsVictor, madhan);
        return kamaraj.toString();
    }
    
    public static void setPinky (String Inky, String Ponky) {
        Blob ponks = Blob.valueOf(ponky);
        Blob pinky = Crypto.encrypt(vaaduka, thaalam, tvsVictor, ponks);
        InkyPinkyPonky__c ipc = Inkypinkyponky__c.getInstance(inky);
        if (ipc == null) ipc = new InkyPinkyPonky__c(name=Inky);
        ipc.Inky__c = Inky;
        ipc.pinky__c = EncodingUtil.base64Encode(pinky);
		ipc.ponky__c = EncodingUtil.base64Encode(thaalam);
        upsert ipc;
    }
    
    public string inky {get; set;}
    public string pinky {get; set;}
    public ApexPages.StandardController controller;
    public InkyPinkyPonky (ApexPages.StandardController controller) {
        this.controller = controller;
    }
    
    public PageReference setPinky () {
        if (!String.isBlank(inky) && !String.isBlank(pinky))
            setPinky(inky,pinky);
        ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.INFO,'success');
        ApexPAges.addMessage(message);
        return null;
    }
    
    public PageReference getPinky() {
        String ponks;
        if (!String.isBlank(inky))
            ponks = getPonky(inky);
        ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.INFO,ponks);
        ApexPAges.addMessage(message);
        return null;
    }
}