int l=0;
void press() {
  background(#0B00B9); 
  if (l<50) {
    l++;
  }
  textSize(l);
  text("Hola", width/2, height/2);
  textSize(25);
  text("Pulsar cualquier tecla", width/2, 3*height/4+30);
  textSize(15); 
  text("Bienvenidos a Atlantis, ten cuidado \n que los enemigos no te coman:)", width/2, 3*height/4.5);
  if (keyPressed) {
    state=1;
  }
}
int a=0;
void nivel2(){

background(#9FB9FA); 
  if (a<50) {
    a++;
  }
  textSize(a);
  text("Nivel 2", width/2, height/2);
  textSize(25);
  text("Pulsar cualquier tecla para continuar...", width/2, 3*height/4+30);
  textSize(15); 
  text("felicitaciones, pasaste al siguiente nivel", width/2, 3*height/4.5);
  if (keyPressed) {
    state=4;
  }
}  

int q=0;
void nivel3(){

background(#9FB9FA); 
  if (q<50) {
    q++;
  }
  textSize(q);
  text("Nivel 3", width/2, height/2);
  textSize(25);
  text("Pulsar cualquier tecla para continuar...", width/2, 3*height/4+30);
  textSize(15); 
  text("felicitaciones, pasaste al siguiente nivel", width/2, 3*height/4.5);
  if (keyPressed) {
    state=5;
  }
}  
