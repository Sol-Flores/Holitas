import hypermedia.net.*;
UDP udp; 
PImage pez, malo, malo1, malo2, fondo, fondo1, fondo2, alga, alga1, bola, dori;//malo pez lobo y el malo1 es el tiburon enojao
PImage vida1, vida2, vida3, vida4, vida5;
PImage bnivel, bcolor, bjugar, bn1, bn2, bn3, bn4, bnaranja, brojo, bazul;
PImage nivel;
PImage inter, intern2, intern3, intern4, GANAR, PERDER;
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
npc playerdori;

int xa=520, xa1=410, ya=410, ya1=390;
int xrojo, yrojo, xazul, yazul, xnaranja, ynaranja;
int xnivel1, ynivel1, xnivel2, ynivel2, xnivel3, ynivel3, xnivel4, ynivel4;
int vida=5;
int time, cntime=0;
float v=5;
float xmalo=width/2, ymalo=height/2;
//float xnivel=random(width, 2*width), ynivel=random(0,width);
//float xnivel,ynivel;
chat  chateo;

void setup() {
  udp = new UDP( this, 5000 );
  //udp.log( true );     // <-- printout the connection activity
  udp.listen( true );
  size(696, 460);

  //textFont();
  pez=loadImage("pez.png");
  dori=loadImage("dori.png");
  malo=loadImage("malo.png");
  malo1=loadImage("malo1.png");
  malo2=loadImage("pulpon.png");

  nivel=loadImage("nivel.png");

  inter=loadImage("inter.png");
  intern2=loadImage("intern2.png");
  intern3=loadImage("intern3.png");
  intern4=loadImage("intern4.png");
  PERDER=loadImage("PERDER.png");
  GANAR=loadImage("GANAR.png");

  fondo=loadImage("fondo.png");
  fondo1=loadImage("fondo1.png");
  fondo2=loadImage("fondo2.png");

  vida5=loadImage("vida5.png");
  vida4=loadImage("vida4.png");
  vida3=loadImage("vida3.png");
  vida2=loadImage("vida2.png");
  vida1=loadImage("vida1.png");

  alga=loadImage("alga.png");
  alga1=loadImage("alga1.png");
  bola=loadImage("bola.png");

  bjugar=loadImage("bjugar.png");
  bcolor=loadImage("bcolor.png");
  bnivel=loadImage("bnivel.png");
  bn1=loadImage("bn1.png");
  bn2=loadImage("bn2.png");
  bn3=loadImage("bn3.png");
  bn4=loadImage("bn4.png");
  brojo=loadImage("brojo.png");
  bazul=loadImage("bazul.png");
  bnaranja=loadImage("bnaranja.png");

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
  xnaranja=width/2+150; 
  ynaranja= height/2-70;

  xnivel2=width/2+150; 
  ynivel2=height/2; 
  xnivel3=width/2+150; 
  ynivel3= height/2+70;
  xnivel4=width/2+150; 
  ynivel4= height/2+70+70;
  xnivel1=width/2+150; 
  ynivel1= height/2-70;

  player = new npc(width*0.1+9, height*0.5, pez);
  playerdori = new npc(width/2, height/2, dori);


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
      background(fondo1);
      noStroke();
      image(bjugar, xjugar, yjugar);
      if (mouseX<xjugar+190/2 && mouseX>xjugar-190/2 && mouseY<yjugar+50/2 && mouseY>yjugar-50/2) {
        textSize(35);
        if (mousePressed) { 
          fill(155, 0, 0);
          state=2;
        }
      }
      textSize(25);
      noStroke(); 
      image(bcolor, xcolor, ycolor);
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
      image(bnivel, xnivel, ynivel);

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
      player.movimiento();

      for (int i = 0; i<enemis.length; i++) {
        enemis[i].update();
        if (enemis[i].colide(player)) {
          enemis[i].respawn();
          vida=vida-1;
          break;
        }
      }
      if (vida==0) {
        state=10;
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
      background(fondo1);
      noStroke(); 
      textSize(25);
      image(malo1, width/2-140, yrojo, 88*3, 64*3);
      image(brojo, xrojo, yrojo);
      //cuadrado("Rojo", #FC9496, xrojo, yrojo, 190, 50);
      if (mouseX<xrojo+190/2 && mouseX>xrojo-190/2 && mouseY<yrojo+50/2 && mouseY>yrojo-50/2) { 
        if (mousePressed) {
          colorPersonaje= #FF0307; 
          state=1;
        }
      }
      noStroke(); 
      textSize(25);
      image(bazul, xazul, yazul);
      //cuadrado("Azul", #5D63FF, xazul, yazul, 190, 50);
      if (mouseX<xazul+190/2 && mouseX>xazul-190/2 && mouseY<yazul+50/2 && mouseY>yazul-50/2) { 
        if (mousePressed) {
          colorPersonaje=#0383FF; 
          state=1;
        }
      }
      noStroke(); 
      textSize(25);
      image(bnaranja, xnaranja, ynaranja);
      //cuadrado("Azul", #5D63FF, xazul, yazul, 190, 50);
      if (mouseX<xnaranja+190/2 && mouseX>xnaranja-190/2 && mouseY<ynaranja+50/2 && mouseY>ynaranja-50/2) { 
        if (mousePressed) {
          colorPersonaje=#FAC774; 
          state=1;
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
      player.movimiento();

      for (int i = 0; i<enemis2.length; i++) {
        enemis2[i].update();
        if (enemis2[i].colide(player)) {
          enemis2[i].respawn();
          vida=vida-1;
          break;
        }
      }
      if (vida==0) {
        state=10;
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
      player.movimiento();
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
        state=10;
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
            state=12;
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
  case 8: //niveles interfaces
    {
      background(fondo1);
      noStroke(); 
      textSize(25);
      image(malo, width/2-140, ynivel2, 128*3, 64*3);
      image(bn1, xnivel1, ynivel1);
      //cuadrado("Nivel 1", #FC9496, xnivel1, ynivel1, 190, 50);
      if (mouseX<xnivel1+190/2 && mouseX>xnivel1-190/2 && mouseY<ynivel1+50/2 && mouseY>ynivel1-50/2) { 
        if (mousePressed) { 
          cntime=0;
          vida=5;
          state=2;//nivel1
        }
      }
      noStroke(); 
      textSize(25);
      image(bn2, xnivel2, ynivel2);
      //cuadrado("Nivel 2", #FC9496, xnivel2, ynivel2, 190, 50);
      if (mouseX<xnivel2+190/2 && mouseX>xnivel2-190/2 && mouseY<ynivel2+50/2 && mouseY>ynivel2-50/2) { 
        if (mousePressed) {
          cntime=30;
          vida=5;
          state=4;//nivel2
        }
      }
      noStroke(); 
      textSize(25);
      image(bn3, xnivel3, ynivel3);
      //cuadrado("Nivel 3", #FC9496, xnivel3, ynivel3, 190, 50);
      if (mouseX<xnivel3+190/2 && mouseX>xnivel3-190/2 && mouseY<ynivel3+50/2 && mouseY>ynivel3-50/2) { 
        if (mousePressed) { 
          cntime=60;
          vida=5;
          state=5;//nivel3
        }
      }
      noStroke(); 
      textSize(25);
      image(bn4, xnivel4, ynivel4);
      //cuadrado("Nivel 3", #FC9496, xnivel3, ynivel3, 190, 50);
      if (mouseX<xnivel4+190/2 && mouseX>xnivel4-190/2 && mouseY<ynivel4+50/2 && mouseY>ynivel4-50/2) { 
        if (mousePressed) { 
          cntime=120;
          vida=5;
          state=11;//nivel3
        }
      }
    }
    break;
  case 9:
    {
      cntime=0;
      vida=5;
      finjuego();
    }
    break;
  case 10:
    {
      cntime=0;
      vida=5;
      perdiste();
    }
    break;
  case 11:   
    {//multijugador nivel 4
      int xllego, xenvio, yllego, yenvio;
      if (time != second()) {
        cntime++;        
        time = second();
      }

      background(fondo);
      player.control();
      playerdori.spamdori();
      player.movimiento();
      //playerdori.movimiento();
      if (playerdori != null) {// 192.168.100.111
        playerdori.spamdori();
      }

      //for (int i = 0; i<enemis.length; i++) {
      //enemis[i].update();
      if (player.colide(playerdori)) {
        //enemis[i].respawn();
        if(keyPressed){
        vida=vida;  
        }
        vida=vida-1;
        break;
      }
      //}
      if (vida==0) {
        state=10;
        //init();
        //vida5=loadImage("vida5.png"); 
        //vida=5;
      }
      viviendo();
      fill(0);
      textSize(20);
      text(" Nivel: 4", width/4, height/10+5);
      text("Time: "+cntime, width/4, height/10+35);

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

  case 12:
    {
      nivel4();
    }
    break;
  }
  String ip       = "localhost";  // the remote IP address 172.18.5.74
  int port        = 4000;    // the destination port


  chateo =new chat(ip, "", port);
  //no se que hice aca, solo anda
  chateo.output(int(player.x), int(player.y));
  udp.send(chateo.MSJ, ip, port );
}

void keyPressed() {
}
void receive( byte[] data, String ip, int port ) {  // <-- extended handler

  data = subset(data, 0, data.length);
  String message = new String( data );

  chateo.MSJ=message;
  chateo= new chat (ip, chateo.MSJ, port);
  chateo.input();
  playerdori.x=chateo.x;
  playerdori.y=chateo.y;
  //msje="";
}
