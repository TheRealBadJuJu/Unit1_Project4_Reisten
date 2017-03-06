Game g;
Screen s;
int screen=0;
int m=5;
int sizeH= 50;
int sizeE= 50;
int score = 0;
int heroy1 = (height/2)/2;
int herox1 = 25;
int heroy2 = height/2+(height/2)/2;
int Highscore = parseInt("Highscore.txt");
float herox;
float heroy;
PImage Hero;
PImage Monster;
int Enemycount= 5;
float[] enemyX = new float[Enemycount];
float[] enemyY = new float[Enemycount];
int[] speedX = new int[Enemycount];
int[] speedY = new int[Enemycount];
PrintWriter output;


import ddf.minim.*;

Minim minim;
AudioPlayer song;

void setup()
{
  size(1000, 600);
  s = new Screen();
  g = new Game();
  rectMode(CENTER);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.play();
  song.loop();
}

void draw()
{
  s.checkScreen();
}
void keyPressed()
{
  if (key == ' ')
  {
    if (score>Highscore)
    {
      output = createWriter("Highscore.txt");
      output.println(score);
      output.close();
      g.reset();
      screen = 0;
    } else
    {
      g.reset();
      screen = 0;
    }
  }
}

void mouseClicked()
{
  if (screen == 0 && dist(mouseX, mouseY, (width/2)/2, 525)<50)
  {
    screen = 1;
  }
  if (screen == 0 && dist(mouseX, mouseY, (width/2)/2+width/2, 525)<50)
  {
    screen = 3;
  }
}