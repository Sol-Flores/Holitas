float l=190, ll=50/30; 
void press() {
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
void nivel2(){

background(intern2); 
  
  if (keyPressed&&key== ENTER) {
    state=4;
  }
}  

int q=0;
void nivel3(){

background(intern3); 
    if (keyPressed&&key== ENTER) {
    state=5;
  }
} 

void nivel4(){

background(intern4); 
    if (keyPressed&&key== ENTER) {
    state=11;
  }
} 

void finjuego(){

background(GANAR); 
  if (keyPressed&&key== 'R' ||keyPressed&&key== 'r') {
    state=0;
  }
}  

void perdiste(){

background(PERDER); 
  
  if (keyPressed&&key== 'R' ||keyPressed&&key== 'r') {
    cntime=0;
    state=0;
  }
}  
