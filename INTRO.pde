
void intro () {
  intro.play();
  image(gif[f], 0, 0, width, height);
  println("frameCount");
  if (frameCount % 2 == 0) f = f + 1;
  if (f == numberOfFrames) f = 0;
  fill (255);
  text ("Breakout", 323, 200);
  fill (0);
  rect (400, 500, 200, 100);
  textSize (75);
  fill (255);
  text ("Start", 423, 575);
  fill (0);
}

void introClicks () {
  if (mouseX > 400 && mouseX < 600 && mouseY > 500 && mouseY < 600)
    mode = GAME;
  image(gif[f], 0, 0, width, height);
  println("frameCount");
  if (frameCount % 2 == 0) f = f + 1;
  if (f == numberOfFrames) f = 0;
}
