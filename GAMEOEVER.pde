void gameover() {
  background(28, 191, 211);
  fill(0);
  rect (400, 500, 200, 100);
  fill(255);
  textSize (50);
  text ("restart", 400, 550);
  int i = 0;
  while (i < n) {
    alive[i] = true;
    i=i+1;
    win.play();
  }
  if (lives == 0) {
    textSize (75);
    text ("YOU LOSE", 323, 200);
  }
  if (leftscore == 5) {
    textSize (75);
    text ("YOU WIN", 323, 200);
  }
}

void gameoverClicks () {
  if (mouseX > 400 && mouseX < 600 && mouseY > 500 && mouseY < 600)
    mode = INTRO;
  //ball
  ballx = width/2;
  bally = height/2+50;
  balld = 10;
  vx = random (-5, 5);
  vy = random (-5, 5);
  lives = 3;
  leftscore =0;
  intro.rewind();
}
