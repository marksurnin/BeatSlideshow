import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

PImage[] images = new PImage[30]; 
int counter = 0; 
float eRadius;
float beat1 = -1;
float songbeat = -1;


void setup()
{
  size(1200, 750, P3D);
  minim = new Minim(this);
  song = minim.loadFile("audio.mp3", 2048);
  song.play();
  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  ellipseMode(RADIUS);
  eRadius = 100;
  
  for (int i = 0; i < images.length; i++) 
  { 
    images[i] = loadImage(nf(i, 3) + ".jpg"); // nf() allows to generate 01, 02, etc. 
  }
}

void draw()
{
  background(0);
  beat.detect(song.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  image(images[counter], 0, 0); 
  if (beat.isOnset()) {
    counter = ++counter % images.length;
//    if (beat1 < 0) {
//      beat1 = millis();
//    } else if (songbeat < 1) {
//      songbeat = millis() - beat1;
//    }
    //print(songbeat);
    //eRadius = 180;
  }
  //ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
}
