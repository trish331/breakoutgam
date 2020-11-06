
void game() {
  background(0);
  //paddle
  fill(255);
  circle(leftx, lefty, leftd);

  //move paddles
  if (wkey == true && leftx >= leftd/2) leftx = leftx - 5;
  if (skey == true && leftx <= width - (leftd/2)) leftx = leftx + 5;


  //ball
  circle(ballx, bally, balld);

  //move ball
  ballx = ballx + vx;
  bally = bally + vy;



  //bouncing
  if (dist(leftx, lefty, ballx, bally)<=leftd/2+balld/2) {
    vx = (ballx - leftx)/10;
    vy = (bally - lefty)/10;
    beep.rewind();
    beep.play();
  }
  if (ballx < balld/2|| ballx > width-balld/2) {
    vx = vx * -1;
    boop.rewind();
    boop.play();
  }
  if (bally < 50) {
    vy = vy * -1;
    boop.rewind();
    boop.play();
  }
  if (bally > height-50) {
    lives = lives -1;
    failure.rewind();
    failure.play();

    //ball
    ballx = width/2;
    bally = height/2+50;
    balld = 10;
    vx = random (-5, 5);
    vy = random (-5, 5);
  }
  if (lives == 0) {
    mode = GAMEOVER;
  }
  if (leftscore == 5) {
    mode = GAMEOVER;
  }

  //scoreboard
  textSize(50);
  fill(190, 47, 193);
  text (leftscore, 900, 800);

  //lives
  textSize(50);
  fill(190, 47, 193);
  text (lives, 100, 800);

  //bricks
  int i = 0;
  while ( i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }
}


void gameClicks() {
  mode = PAUSE;
}
void manageBrick(int i) {
  if (y[i] == 100) fill(lightblue);
  if (y[i] == 200) fill(turquoise);
  if (y[i] == 300) fill(green);
  if (y[i] == 400) fill(darkgreen);
  circle (x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) < balld/2 + brickd/2) {
    vx = (ballx - x[i])/10;
    vy = (bally - y[i])/10;
    alive[i] = false;
    //scoring
    leftscore = leftscore+1;
    smash.rewind();
    smash.play();
  }
}
