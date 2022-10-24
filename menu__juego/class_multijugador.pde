class chat {
  String IP, MSJ;
  int x;
  int y;
  int PORT;

  chat(String ip, String msj, int port) {
    IP=ip;
    MSJ=msj;
    PORT=port;
  }

  void output(int xl, int yl) {
    x=xl;
    y=yl;
    String out ="";
    out+="<"; 
    out+=str(x);
    out+="-";
    out+=str(y);
    out+=">";
    MSJ=out;
  }

  void input() {
    String in = MSJ; 
    String[] aux= split(in, ">");
    in= aux[0];
    String[] aux1= split(in, "<");
    in= aux1[1];
    String[] aux2= split(in, "-");
    x= int(aux2[0]);
    y= int(aux2[1]);
  }


  void spam() {
    textAlign(CENTER);
    rectMode(CENTER);
    fill(0);rect(x, y, 100, 50);
    fill(255);
    text(x+"     "+y, x, y);
  }
}
