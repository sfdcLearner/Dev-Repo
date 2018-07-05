public class ExcelWriter {
    public ExcelWriter () {
    	XmlStreamWriter xsw = new XmlStreamWriter();
        xsw.writeStartDocument('utf-8', '1.0');
    	xsw.writeStartElement('Start', 'version', '"1.0"');
        xsw.writeCharacters('text');
        xsw.writeEndElement();        
        system.debug('xw +++' + xsw.getXmlString());
        
        Attachment newatt = new Attachment ();
        newatt.Body = Blob.valueOf(xsw.getXmlString());
        newatt.Name = 'testatt.xls';
        newAtt.ParentId = [select id from account limit 1].id;
        //newatt.ContentType = '.html';
        insert newatt;
        xsw.close();
    }

    public static void somemethod() {
        system.debug('Anydatatype_msg');
    }
}