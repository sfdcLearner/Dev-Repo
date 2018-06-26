public class HelloWorld {
	void HelloWorld(){
		System.debug('Test Constructor');
		HelloWorld.sayHello();
	}
		public static void sayHello() {
        System.debug( 'Hello' );
        HelloWorld.sayWorld();
		}
		public static void sayWorld() {
        System.debug( 'World' );
        }
}