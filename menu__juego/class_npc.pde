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

  void moveproyectil() {
    this.x += xv*v;
    this.y += yv*v;
  }
  void control() {
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
  void update() {
    image(logo, x, y);
    x -= v;   
    if (x<0) {
      x = random(width, 2*width);
      y = random(0, width);
    }
  }
  void upda() {
    image(logo, x, y);
    x += xv*v;
    
   y += yv*v;
    
    
  }
  boolean colide(npc player) {
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
  void respawn() {
    x = random(width, 2*width);
    y = random(0, width);
  }
  void megaene(npc player) {
    x= 535;
    y=random(152, 455);
    float dx = this.x - player.x;
    float dy = this.y - player.y;
    float hip = -1 * sqrt(pow(dx, 2)+pow(dy, 2));
    this.xv = dx/hip;
    this.yv = dy/hip;
  }
}
