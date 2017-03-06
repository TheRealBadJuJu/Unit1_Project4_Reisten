class Screen
{
  Screen()
  {
    String lines[] = loadStrings("Highscore.txt");
    println("there are " + lines.length + " lines");
    for (int i = 0; i < lines.length; i++)
    {
      println(lines[i]);
    }
  }
  void homeScreen()
  {
    background(0, 0, 0);
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("Julius' Game", width/2, height/2);
    strokeWeight(20);
    fill(255, 0, 0);
    stroke(255, 0, 0, 30);
    rect((width/2)/2, 525, 100, 100);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(20);
    text("1 plr", (width/2)/2, 525);
    strokeWeight(20);
    fill(255, 0, 0);
    stroke(255, 0, 0, 30);
    rect((width/2)/2+width/2, 525, 100, 100);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(20);
    text("2 plr", (width/2)/2+width/2, 525);
    text("(WIP)", (width/2)/2+width/2, 550);
    fill(255,0,0);
  }
  void gameScreen()
  {

    background(0, 0, 0);
    strokeWeight(25);
    stroke(0, 0, 255, 30);
    fill(157);
    rect(25, height/2, sizeH+sizeE+40, height);
    g.drawEnemy();
    g.moveEnemy();
    g.checkEnemy();
    g.drawHero();
    g.moveHero();
    g.Scoreboard();
    g.checkDeath();
    g.checkPosition();
  }

  void gameScreen2()
  {
    background(0, 0, 0);
    strokeWeight(25);
    stroke(0, 0, 255, 30);
    fill(157);
    rect(25, height/2, sizeH+sizeE+40, height);
    g.drawEnemy();
    g.moveEnemy();
    g.checkEnemy();
    g.Scoreboard();
    g.drawHero2();
    g.moveHero();
  }

  void deathScreen()
  {
    background(0, 0, 0);
    fill(255, 0, 0);
    textSize(50);
    textAlign(CENTER);
    text("You died", width/2, height/2);
    textSize(20);
    fill(255, 0, 0);
    textSize(20);
    textAlign(CENTER);
    text("Press space to restart", width/2, 100);
    g.Scoreboard();
  }
  void checkScreen()
  {
    if (screen == 0)
    {
      s.homeScreen();
    }
    if (screen == 1)
    {
      s.gameScreen();
    }
    if (screen == 2)
    {
      s.deathScreen();
    }
    if (screen == 3)
    {
      s.gameScreen2();
    }
  }
}