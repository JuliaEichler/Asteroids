public class GameOver extends DisplayObject {
	void draw() {
		// Set the font and its size (in units of pixels)
		textFont(fontA, 32);
		textAlign(CENTER);
		
		fill(255);
		text("G A M E   O V E R", width/2, height/2);

                textFont(fontA, 24);
                text("Shoot To Restart The Game!", width/2, height * 0.6);
	}
}
