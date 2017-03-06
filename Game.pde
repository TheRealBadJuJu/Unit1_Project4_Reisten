class Game
{
  Game()
  {
    textAlign(width);
    Hero = loadImage("Hero.png");
    Monster = loadImage("Monster.png");
    Hero.resize(sizeH, sizeH);
    Monster.resize(sizeE, sizeE);
    herox=25;
    heroy=height/2;
    for (int i=0; i<Enemycount; i++)
    {
      enemyX[i] = random(50+sizeE, width-sizeE/2);
      enemyY[i] = random(sizeE/2, height-sizeE/2);
      speedX[i] = int(random(-5, 5));
      speedY[i] = int(random(-5, 5));
    }
  }
  void reset()
  {
    herox=25;
    score=0;
    for (int i=0; i<Enemycount; i++)
    {
      speedX[i] = int(random(-5, 5));
      speedY[i] = int(random(-5, 5));
    }
  }

  void drawHero()
  {
    image(Hero, herox, heroy);
    noFill();
    noStroke();
    ellipse(herox, heroy, sizeH, sizeH);
  }

  void drawEnemy()
  {
    for (int i=0; i<Enemycount; i++)
    {
      image(Monster, enemyX[i], enemyY[i]);
      noFill();
      noStroke();
      ellipse(enemyX[i], enemyY[i], sizeE, sizeE);
    }
  }
  void drawHero2()
  {
    image(Hero, herox, heroy);
    image(Hero, herox1, heroy1);
    noFill();
    noStroke();
    ellipse(herox1, heroy1, sizeH, sizeH);
    ellipse(herox, heroy, sizeH, sizeH);
  }
  void moveEnemy()
  {
    for (int i=0; i<Enemycount; i++)
    {
      enemyX[i]+=speedX[i];
      enemyY[i]+=speedY[i];
    }
  }

  void moveHero()
  {
    if (key == 'd')
    {
      herox+=2;
    }
    if (key == 'a')
    {
      herox-=2;
    }
    if (key == 'w')
    {
      heroy-=2;
    }
    if (key == 's')
    {
      heroy+=2;
    }
    if (key == ';')
    {
      herox1+=2;
    }
    if (key ==  'k')
    {
      herox1-=2;
    }
    if (key == 'l')
    {
      heroy1+=2;
    }
    if (key == 'o')
    {
      heroy1-=2;
    }
    if (herox<sizeH/2)
    {
      herox = sizeH/2;
    }
    if (herox1<sizeH/2)
    {
      herox1 = sizeH/2;
    }
    if (heroy<sizeH/2)
    {
      heroy = sizeH/2;
    }
    if (heroy1<sizeH/2)
    {
      heroy1 = sizeH/2;
    }
  }

  void checkEnemy()
  {
    for (int i=0; i<Enemycount; i++)
    {
      if (enemyX[i]>width-sizeE/2)
      {
        speedX[i]=-speedX[i];
      }
      if (enemyX[i]<sizeH+sizeE/2)
      {
        speedX[i]=-speedX[i];
      }
      if (enemyY[i]>height-sizeE/2)
      {
        speedY[i]=-speedY[i];
      }
      if (enemyY[i]<sizeE/2)
      {
        speedY[i]=-speedY[i];
      }
      for (int j=0; j<Enemycount*2; j++)
      {
        if ( i == j)
        {
          break;
        }
        if (dist(enemyX[i], enemyY[i], enemyX[j], enemyY[j])<=sizeE)
        {
          speedX[i]=-speedX[i];
          speedY[i]=-speedY[i];
          speedX[j]=-speedX[j];
          speedY[j]=-speedY[j];
        }
      }
    }
  }
  void checkDeath()
  {
    for (int i=0; i<Enemycount; i++)
    {
      for (int j=0; j<Enemycount*2; j++)
      {
        if ( i == j)
        {
          break;
        }
        if (dist(herox, heroy, enemyX[j], enemyY[j])<=sizeE/2+sizeH/2)
        {
          screen = 2;
          herox=25;
          heroy=height/2;
        }
        if (dist(herox1, heroy1, enemyX[j], enemyY[j])<=sizeE/2+sizeH/2)
        {
          screen = 2;
          herox=25;
          heroy=height/2;
        }
      }
    }
  }
  void Scoreboard()
  {
    textSize(50);
    fill(0, 0, 255);
    text(score, 50, 75);
  }

  void checkPosition()
  {
    if (herox>width && screen == 1)
    {
      herox=25;
      heroy=height/2;
      score+=1;
      for (int i=0; i<Enemycount; i++)
      {
        speedX[i]+=1;
        speedY[i]+=1;
      }
    }
    if (herox>width && screen == 3 && herox1>width)
    {
      herox=25;
      heroy=height/2;
      herox1=25;
      heroy=height/2+(height/2)/2;
      score+=1;
      for (int i=0; i<Enemycount; i++)
      {
        speedX[i]+=1;
        speedY[i]+=1;
      }
    }
  }
}