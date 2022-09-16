PImage pez, malo, malo1, malo2, fondo, alga, alga1, bola;//malo pez lobo y el malo1 es el tiburon enojao
PImage vida1, vida2, vida3, vida4, vida5;
PImage nivel;
//fghjklkjhgfghjk
int state;//x, y;
float inc=5; //jugador
color colorPersonaje=#FAC774;

int xjugar, yjugar, xcolor, ycolor, xnivel, ynivel; //botones

npc player;
npc[] enemis = new npc[10];
npc[] nivel2= new npc[2];
npc[] nivel3= new npc[2];
npc[] enemis2=new npc[10];
npc[] megaenemi=new npc[5];

int xa=520, xa1=410, ya=410, ya1=390;
int xrojo, yrojo, xazul, yazul;
int xnivel1, ynivel1, xnivel2, ynivel2, xnivel3, ynivel3;
int vida=5;
int time, cntime=0;
float v=5;
float xmalo=width/2, ymalo=height/2;
//float xnivel=random(width, 2*width), ynivel=random(0,width);
//float xnivel,ynivel;

void setup() {

  size(696, 460);


  pez=loadImage("pez.png");
  malo=loadImage("malo.png");
  malo1=loadImage("malo1.png");
  malo2=loadImage("gnormal.png");

  nivel=loadImage("nivel.png");

  fondo=loadImage("fondo.jpg");

  vida5=loadImage("vida5.png");
  vida4=loadImage("vida4.png");
  vida3=loadImage("vida3.png");
  vida2=loadImage("vida2.png");
  vida1=loadImage("vida1.png");

  alga=loadImage("alga.png");
  alga1=loadImage("alga1.png");
  bola=loadImage("bola.png");

  imageMode(CENTER);
  rectMode(CENTER); 
  textAlign(CENTER);

  xjugar=width/2; 
  yjugar= height/2; 
  xcolor=width/2; 
  ycolor= height/2+70;
  xnivel=width/2;
  ynivel=height/2-70;

  xrojo=width/2+150; 
  yrojo=height/2; 
  xazul=width/2+150; 
  yazul= height/2+70;

  xnivel2=width/2+150; 
  ynivel2=height/2; 
  xnivel3=width/2+150; 
  ynivel3= height/2+70;
  xnivel1=width/2+150; 
  ynivel1= height/2-70;

  player = new npc(width*0.1, height*0.5, pez);

  for (int i=0; i<nivel2.length; i++) {
    float xnivel=random(width, 2*width); 
    float ynivel=random(0, width);
    noTint();
    nivel2[i]= new npc(xnivel, ynivel, nivel);
  }
    for (int i=0; i<nivel3.length; i++) {
    float xnivel=random(width, 2*width); 
    float ynivel=random(0, width);
    noTint();
    nivel3[i]= new npc(xnivel, ynivel, nivel);
  }


  for (int i = 0; i<enemis.length; i++) {
    float x = random(width, 2*width);
    float y = random(0, width);
    noTint();
    enemis[i] = new npc(x, y, malo) ;
  }

  for (int i = 0; i<enemis2.length; i++) {
    float x = random(width, 2*width);
    float y = random(0, width);
    noTint();
    enemis2[i] = new npc(x, y, malo1) ;
  }
  for (int i = 0; i<1; i++) {
    float x = xmalo;
    float y = ymalo;
    noTint();
    megaenemi[i] = new npc(x, y, bola) ;
  }
  //megaenemi[1]= new npc(xmalo, ymalo, malo2);
}

void draw() {
  switch(state) {
  case 0:
    {
      press();
    }
    break;
  case 1: 
    {
      background(255, 255, 255, 50);
      noStroke();
      cuadrado("Jugar", #D7E7ED, xjugar, yjugar, 190, 50);
      if (mouseX<xjugar+190/2 && mouseX>xjugar-190/2 && mouseY<yjugar+50/2 && mouseY>yjugar-50/2) {
        textSize(35);
        if (mousePressed) { 
          fill(155, 0, 0);
          state=2;
        }
      }
      textSize(25);
      noStroke(); 
      cuadrado("Cambiar color", #D7E7ED, xcolor, ycolor, 190, 50);

      if (mouseX<xcolor+190/2 && mouseX>xcolor-190/2 && mouseY<ycolor+50/2 && mouseY>ycolor-50/2) { 
        textSize(35);
        if (mousePressed) {
          fill(155, 0, 0);
          state=3;
          break;
        }
      }
      textSize(25);
      noStroke(); 
      cuadrado("Niveles", #D7E7ED, xnivel, ynivel, 190, 50);

      if (mouseX<xnivel+190/2 && mouseX>xnivel-190/2 && mouseY<ynivel+50/2 && mouseY>ynivel-50/2) { 
        textSize(35);
        if (mousePressed) {
          fill(155, 0, 0);
          state=8;
          break;
        }
      }
      textSize(25);
    }
    break;
    ///////////////////////////JUEGO
  case 2:    //nivel1
    {
      v=5;
      if (time != second()) {
        cntime++;        
        time = second();
      }

      background(fondo);
      player.control();

      for (int i = 0; i<enemis.length; i++) {
        enemis[i].update();
        if (enemis[i].colide(player)) {
          enemis[i].respawn();
          vida=vida-1;
          break;
        }
      }
      if (vida==0) {
        state=1;
        init();
        vida5=loadImage("vida5.png"); 
        vida=5;
      }
      viviendo();
      fill(0);
      textSize(20);
      text(" Nivel: 1", width/4, height/10+5);
      text("Time: "+cntime, width/4, height/10+35);
      //image(vida5,width/2,height/10, 125,25 );
      if (cntime>30) {
        //ellipse(xnivel-=3,ynivel,10,10);
        //if(xnivel<0 ){xnivel=random(0,width); ynivel=random(0,height);}
        for (int i = 0; i<nivel2.length; i++) {
          nivel2[i].update();
          if (nivel2[i].colide(player)) {
            nivel2[i].respawn();
            //break;
            state=6;
          }
        }
      }
      if (cntime == 60) {
        init();
        cntime = 0;
      }
      //chiche
      image(alga, xa-=3, ya, 100, 100);
      if (xa <0) {
        xa = width;
      }

      if (keyPressed&&key=='P' || keyPressed&&key=='p' ) {
        state=1;
      }//pausa
    }    
    break;
    /////////////////////////////////colores
  case 3:    
    {
      background(255, 255, 255, 9);
      noStroke(); 
      textSize(25);
      cuadrado("Rojo", #FC9496, xrojo, yrojo, 190, 50);
      if (mouseX<xrojo+190/2 && mouseX>xrojo-190/2 && mouseY<yrojo+50/2 && mouseY>yrojo-50/2) { 
        if (mousePressed) {
          colorPersonaje= #FF0307; 
          state=2;
        }
      }
      noStroke(); 
      textSize(25);
      cuadrado("Azul", #5D63FF, xazul, yazul, 190, 50);
      if (mouseX<xazul+190/2 && mouseX>xazul-190/2 && mouseY<yazul+50/2 && mouseY>yazul-50/2) { 
        if (mousePressed) {
          colorPersonaje=#0383FF; 
          state=2;
        }
      }
    }
    break;

  case 4://nivel2
    {
      if (time != second()) {
        cntime++;        
        time = second();
      }

      v=7;
      background(fondo);
      player.control();

      for (int i = 0; i<enemis2.length; i++) {
        enemis2[i].update();
        if (enemis2[i].colide(player)) {
          enemis2[i].respawn();
          vida=vida-1;
          break;
        }
      }
      if (vida==0) {
        state=1;
        init();
        vida5=loadImage("vida5.png"); 
        vida=5;
      }
      viviendo();
      fill(0);
      textSize(20);
      text(" Nivel: 2", width/4, height/10+5);
      text("Time: "+cntime, width/4, height/10+35);
      if (cntime>50) {
        for (int i = 0; i<nivel2.length; i++) {
          nivel2[i].update();
          if (nivel2[i].colide(player)) {
            nivel2[i].respawn();
            //break;
            state=7;
          }
        }
      }

      //chiche
      image(alga, xa-=3, ya, 100, 100);
      if (xa <0) {
        xa = width;
      }

      if (keyPressed&&key=='P' || keyPressed&&key=='p' ) {
        state=1;
      }//pausa
    }    
    break;

  case 5: //nivel 3
    {
      v=5;      
      if (time != second()) {
        cntime++;        
        megaenemi[0].megaene(player);
        time = second();
      }

      
      background(fondo);

      player.control();
      //medidor
      //fill(0); text("x= " + mouseX +"y= " + mouseY, mouseX, mouseY);
      for (int i = 0; i<1; i++) {
        megaenemi[i].upda();
        megaenemi[i].moveproyectil();
        if (megaenemi[i].colide(player)) {
          megaenemi[i].megaene(player);
          vida=vida-1;
          break;
        }
      }
      image(malo2, 570, 300);
      if (vida==0) {
        state=1;
        init();
        vida5=loadImage("vida5.png"); 
        vida=5;
      }
      viviendo();
      fill(0);
      textSize(20);
      text(" Nivel: 2", width/4, height/10+5);
      text("Time: "+cntime, width/4, height/10+35);


      if (cntime>100) {
        for (int i = 0; i<nivel2.length; i++) {
          nivel2[i].update();
          if (nivel2[i].colide(player)) {
            nivel2[i].respawn();
            state=9;
            break;
          }
        }
      }


      //chiche
      image(alga, xa-=3, ya, 100, 100);
      if (xa <0) {
        xa = width;
      }

      if (keyPressed&&key=='P' || keyPressed&&key=='p' ) {
        state=1;
      }//pausa
    }    
    break;
  case 6:
    {
      nivel2();
    }
    break; //interfaz nivel 2
  case 7: 
    {
      nivel3();
    }
    break; //interfaz nivel 3
  case 8: 
    {
      background(255, 255, 255, 9);
      noStroke(); 
      textSize(25);
      cuadrado("Nivel 1", #FC9496, xnivel1, ynivel1, 190, 50);
      if (mouseX<xnivel1+190/2 && mouseX>xnivel1-190/2 && mouseY<ynivel1+50/2 && mouseY>ynivel1-50/2) { 
        if (mousePressed) { 
          state=2;//nivel1
        }
      }
      noStroke(); 
      textSize(25);
      cuadrado("Nivel 2", #FC9496, xnivel2, ynivel2, 190, 50);
      if (mouseX<xnivel2+190/2 && mouseX>xnivel2-190/2 && mouseY<ynivel2+50/2 && mouseY>ynivel2-50/2) { 
        if (mousePressed) {

          state=4;//nivel2
        }
      }
      noStroke(); 
      textSize(25);
      cuadrado("Nivel 3", #FC9496, xnivel3, ynivel3, 190, 50);
      if (mouseX<xnivel3+190/2 && mouseX>xnivel3-190/2 && mouseY<ynivel3+50/2 && mouseY>ynivel3-50/2) { 
        if (mousePressed) { 
          state=5;//nivel3
        }
      }
    }
    break;
    case 9:{
      finjuego();
      
    }
    break;
  }
}
