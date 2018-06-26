global with sharing class Random1 {
    public Random1 () {}
    
    @remoteAction
    global static void remoteMethod () {
        system.debug('test successfull');
    }
    
}