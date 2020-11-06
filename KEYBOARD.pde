void keyPressed() {
  if (key == 'w' || key == 'W')wkey = true;
  if (key == 's' || key == 'S')skey = true;
}

void keyReleased () {
  if (key == 'w' || key == 'W')wkey = false;
  if (key == 's' || key == 'S')skey = false;
}
