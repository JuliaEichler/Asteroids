abstract class InputController {
	final int KEY_LEFT    = 37;
	final int KEY_UP      = 38;
	final int KEY_RIGHT   = 39;
	final int KEY_DOWN    = 40;
	final int KEY_SPACE   = 32;
	final int KEY_CTRL    = 17;

        final int SHIP_FIRE   = 51;
        final int SHIP_LEFT   = 21;
        final int SHIP_RIGHT  = 31;
        final int SHIP_MOVE   = 71;
        final int SHIP_STOP   = 81;
	
	public void keyPressed() { }
	public void keyReleased() { }
	public void checkKeyboard() { }
        public void checkUSB(int usbInput) { }
	public void mousePressed() { }
}

