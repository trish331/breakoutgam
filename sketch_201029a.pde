//Breakout 
//Tricia Sun
// Oct 29 2020
//1-1



import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// sound variables
Minim minim;
AudioPlayer beep, boop, smash, failure, intro, win;



//colours
color lightblue = #e8ffff;
color turquoise = #a6f6f1;
color green = #41aea9;
color darkgreen = #213e3b;
//gif variables
PImage [] gif;
int numberOfFrames;
int f;
//brick variables
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;

//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int RESET = 5;

//intro GUI
float a;

//entity variables
float leftx, lefty, leftd; //paddle
float ballx, bally, balld; //ball
float vx, vy;

//scoring
int leftscore, timer;

//lives
int lives;


// keyboard variables
boolean wkey, skey;

void setup() {
  numberOfFrames = 10;
  gif = new PImage[numberOfFrames];
  int j = 0;
  while (j < numberOfFrames ) {
    gif [j] = loadImage("frame_"+j+"_delay-0.06s.gif");
    j++;
  }
  tempx = tempy = 100;
  brickd = 75;
  n = 36;
  x = new int[n];
  y = new int[n];
  alive = new boolean [n]; 

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i=i+1;
  }


  size (1000, 800);
  mode = INTRO;

  //initialize paddle
  leftx = 600;
  lefty = 800;
  leftd = 200;

  //initialize ball
  ballx = width/2;
  bally = height/2+75;
  balld = 10;
  vx = random (-5, 5);
  vy = random (-5, 5);

  //initialize keyboard vars
  wkey = skey = false;

  lives = 3;
  
 // minim
 minim = new Minim(this);
 beep = minim.loadFile ("beep.wav");
 boop = minim.loadFile ("boop.wav");
 smash = minim.loadFile ("break.wav");
 failure = minim.loadFile ("failure.wav");
 intro = minim.loadFile ("intro.wav");
 win = minim.loadFile ("win.wav");
}




void draw () {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == RESET) {
    reset();
  } else {
    println("Mode error: " + mode);
  }
}
