import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class menu__juego extends PApplet {

PImage pez, malo, malo1, malo2, fondo, fondo1, fondo2, alga, alga1, bola;//malo pez lobo y el malo1 es el tiburon enojao
PImage vida1, vida2, vida3, vida4, vida5;
PImage bnivel,bcolor,bjugar,bn1,bn2,bn3,bnaranja,brojo,bazul;
PImage nivel;
PImage inter,intern2,intern3,GANAR,PERDER;
//fghjklkjhgfghjk
int state;//x, y;
float inc=5; //jugador
int colorPersonaje=0xffFAC774;

int xjugar, yjugar, xcolor, ycolor, xnivel, ynivel; //botones

npc player;
npc[] enemis = new npc[10];
npc[] nivel2= new npc[2];
npc[] nivel3= new npc[2];
npc[] enemis2=new npc[10];
npc[] megaenemi=new npc[5];

int xa=520, xa1=410, ya=410, ya1=390;
int xrojo, yrojo, xazul, yazul, xnaranja,ynaranja;
int xnivel1, ynivel1, xnivel2, ynivel2, xnivel3, ynivel3;
int vida=5;
int time, cntime=0;
float v=5;
float xmalo=width/2, ymalo=height/2;
//float xnivel=random(width, 2*width), ynivel=random(0,width);
//float xnivel,ynivel;

public void setup() {

  

  //textFont();
  pez=loadImage("pez.png");
  malo=loadImage("malo.png");
  malo1=loadImage("malo1.png");
  malo2=loadImage("pulpon.png");

  nivel=loadImage("nivel.png");
  
  inter=loadImage("inter.png");
  intern2=loadImage("intern2.png");
  intern3=loadImage("intern3.png");
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
  xnivel1=width/2+150; 
  ynivel1= height/2-70;

  player = new npc(width*0.1f+9, height*0.5f, pez);

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

public void draw() {
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
      image(bjugar,xjugar,yjugar);
      if (mouseX<xjugar+190/2 && mouseX>xjugar-190/2 && mouseY<yjugar+50/2 && mouseY>yjugar-50/2) {
        textSize(35);
        if (mousePressed) { 
          fill(155, 0, 0);
          state=2;
        }
      }
      textSize(25);
      noStroke(); 
      image(bcolor,xcolor,ycolor);
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
      image(bnivel,xnivel,ynivel);

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
      image(malo1,width/2-140,yrojo,88*3,64*3);
      image(brojo,xrojo,yrojo);
      //cuadrado("Rojo", #FC9496, xrojo, yrojo, 190, 50);
      if (mouseX<xrojo+190/2 && mouseX>xrojo-190/2 && mouseY<yrojo+50/2 && mouseY>yrojo-50/2) { 
        if (mousePressed) {
          colorPersonaje= 0xffFF0307; 
          state=1;
        }
      }
      noStroke(); 
      textSize(25);
      image(bazul,xazul,yazul);
      //cuadrado("Azul", #5D63FF, xazul, yazul, 190, 50);
      if (mouseX<xazul+190/2 && mouseX>xazul-190/2 && mouseY<yazul+50/2 && mouseY>yazul-50/2) { 
        if (mousePressed) {
          colorPersonaje=0xff0383FF; 
          state=1;
        }
      }
      noStroke(); 
      textSize(25);
      image(bnaranja,xnaranja,ynaranja);
      //cuadrado("Azul", #5D63FF, xazul, yazul, 190, 50);
      if (mouseX<xnaranja+190/2 && mouseX>xnaranja-190/2 && mouseY<ynaranja+50/2 && mouseY>ynaranja-50/2) { 
        if (mousePressed) {
          colorPersonaje=0xffFAC774; 
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
  case 8: //niveles interfaces
    {
      background(fondo1);
      noStroke(); 
      textSize(25);
      image(malo,width/2-140,ynivel2,128*3,64*3);
      image(bn1,xnivel1,ynivel1);
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
      image(bn2,xnivel2,ynivel2);
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
      image(bn3,xnivel3,ynivel3);
      //cuadrado("Nivel 3", #FC9496, xnivel3, ynivel3, 190, 50);
      if (mouseX<xnivel3+190/2 && mouseX>xnivel3-190/2 && mouseY<ynivel3+50/2 && mouseY>ynivel3-50/2) { 
        if (mousePressed) { 
          cntime=60;
          vida=5;
          state=5;//nivel3
         
        }
      }
    }
    break;
    case 9:{
      cntime=0;
      vida=5;
      finjuego();
      
    }
    break;
    case 10:{
      cntime=0;
      vida=5;
     perdiste(); 
    }
  }
}
class npc {
  float x, y, xl, yl, xv, yv; //v;
  PImage logo;
  boolean flag = false;
  npc(float X, float Y, PImage img) {
    x= X;
    y = Y;
    logo = img; 
    xl = logo.width;  
    yl = logo.height;
  }

  public void moveproyectil() {
    this.x += xv*v;
    this.y += yv*v;
  }
  public void control() {
    tint(colorPersonaje);
    image(logo, x, y);
    noTint();
    if (keyPressed&&key=='D' || keyPressed&&key=='d' ) {
      x= x + inc;
    }//derecha
    if (keyPressed&&key=='A' || keyPressed&&key=='a' ) {
      x= x - inc;
    }//izquierda
    if (keyPressed&&key=='W' || keyPressed&&key=='w' ) {
      y= y - inc;
    }//arriba
    if (keyPressed&&key=='S' || keyPressed&&key=='s' ) {
      y= y + inc;
    }//abajo
    ///////////// limiter
    if (x >width-xl/2 ) {
      x = width-xl/2;
    }
    if (x <xl/2 ) {
      x = xl/2;
    }
    if (y >height-yl/2 ) {
      y = height-yl/2;
    }
    if (y <yl/2 ) {
      y = yl/2;
    }
  }
  public void update() {
    image(logo, x, y);
    x -= v;   
    if (x<0) {
      x = random(width, 2*width);
      y = random(0, width);
    }
  }
  public void upda() {
    image(logo, x, y);
    x += xv*v;
    
   y += yv*v;
    
    
  }
  public boolean colide(npc player) {
    boolean inx = x > player.x-player.xl/2 && x <player.x+player.xl/2;
    boolean iny = y > player.y-player.yl/2 && y <player.y+player.yl/2;
    if (inx && iny) {
      if (!flag) {
        flag = true;
        return true;
      }
    } else {
      flag = false;
    }

    return false;
  }
  public void respawn() {
    x = random(width, 2*width);
    y = random(0, width);
  }
  public void megaene(npc player) {
    x= 535;
    y=random(152, 455);
    float dx = this.x - player.x;
    float dy = this.y - player.y;
    float hip = -1 * sqrt(pow(dx, 2)+pow(dy, 2));
    this.xv = dx/hip;
    this.yv = dy/hip;
  }
}
public void init() {
  player = new npc(width*0.1f, height*0.5f, pez);
  for (int i = 0; i<enemis.length; i++) {
    float x = random(width, 2*width);
    float y = random(0, width);
    enemis[i] = new npc(x, y, malo) ;
    //time=0;
    //vida=5;
  }
}

public void cuadrado(String text, int c, float X, float Y, float tamX, float tamY) { //cuadrados
  fill(c);
  rect(X, Y, tamX, tamY);
  fill(0);
  text(text, X, Y);
}

public void viviendo(){
 if(vida==5){image(vida5,width/2,height/10, 125,25 );} 
 if(vida==4){image(vida4,width/2,height/10, 125,25 );} 
 if(vida==3){image(vida3,width/2,height/10, 125,25 );} 
 if(vida==2){image(vida2,width/2,height/10, 125,25 );} 
 if(vida==1){image(vida1,width/2,height/10, 125,25 ); } 
 }
float l=190, ll=50/30; 
public void press() {
  background(fondo2); 
  if (l<190) {
    l++; 
  }
  if (ll<50) {
     ll++;
  }
  textSize(l);fill(0);
  image(inter, width/2,height/2,l,ll);
  //text("Hola", width/2, height/2);

  if (keyPressed&&key== ENTER) {
    state=1;
  }
}
int a=0;
public void nivel2(){

background(intern2); 
  
  if (keyPressed&&key== ENTER) {
    state=4;
  }
}  

int q=0;
public void nivel3(){

background(intern3); 
    if (keyPressed&&key== ENTER) {
    state=5;
  }
}  

public void finjuego(){

background(GANAR); 
  if (keyPressed&&key== 'R' ||keyPressed&&key== 'r') {
    state=0;
  }
}  

public void perdiste(){

background(PERDER); 
  
  if (keyPressed&&key== 'R' ||keyPressed&&key== 'r') {
    cntime=0;
    state=0;
  }
}  
  public void settings() {  size(696, 460); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "menu__juego" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
