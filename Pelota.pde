/**
  Representa la clase de la que se obtiene
  la pelota del Juego
*/
class Pelota extends GameObject{
  /** color de la pelota*/
  private color colorPelota;
  /** velocidad de la pelota*/
  private PVector velocidad;
  /**radio de la pelota*/
  private float radio;

  /** Constructor por defecto*/
  public Pelota(){
    this.radio = Constantes.RADIO_PELOTA;                                //indica el radio de la pelota
    this.posicion = new PVector(width/2,height/2);  //posición incial en centro de pantalla
    this.colorPelota = color(#FFFFFF);            //se establece el color de la pelota
    boolean bandera = false;                   //variable tipo bandera
    float velX=0;                              // variable auxiliar en x
    while(bandera ==false){  // se itera mientras la bandera no esté en alto
      velX=random(-4,4);     // velocidad en x de modo aleatorio (sale en izq o der)
      if(velX < -1 || velX > 1){ // si el valor no están en rango de 1- y 1
        bandera = true;          // se sube la bandera
      }
    }
    //velocidad = new PVector(-1,1);
    this.velocidad = new PVector(velX,random(-4,4)); //velocidad aleatoria para la pelota
  }
  
  //-------------ZONA DE MÉTODOS ----------------
  
  /**dibuja la palota en el lienzo*/
  public void display(){
    fill(this.colorPelota);
    strokeWeight(1.5);
    stroke(0);
    // observe que la posición es variable y se calcula el diámetro
    circle(this.posicion.x,this.posicion.y,radio*2);
  }
  
  /** Cambia la posición de la pelota en base al vector velocidad*/
  public void mover(){
    this.posicion.add(this.velocidad);
    display(); // observe que se invoca al método display() luego del cammbio de pos
  }
  
  public void rebotar(MesaDeJuego mesa){
    // posición en x de la pelota
    //text("pelota.posicion.x: "+this.posicion.x,10,height-70);
    // 1) Inicialización del punto más cercano de la pared superior de la mesa
    //    Observe que se toma la posición y de la mesa para marcar la pared
    PVector puntoSuperiorMasCercano = new PVector(this.posicion.x,mesa.getPosicion().y);
    //PVector puntoSuperiorMasCercano = new PVector(this.posicion.x,mesa.getPosicion().y);
    // 2) Se determina el punto más cercano de la pared en tiempo real
    if(this.posicion.x < mesa.getPosicion().x){
      puntoSuperiorMasCercano.x=mesa.getPosicion().x;
    }
    if(this.posicion.x > mesa.getPosicion().x + mesa.getAncho()){
      puntoSuperiorMasCercano.x=mesa.getPosicion().x+mesa.getAncho();
    }    
   
    // para que haya colision la distancia entre el punto más cercano y el 
    //centro de la pelota debe ser menor al radio de la pelota
    // la distancia se calcula mediante pitágoras
    float catetoAdyacente= this.posicion.x-puntoSuperiorMasCercano.x;
    float catetoOpuesto = this.posicion.y - puntoSuperiorMasCercano.y;
    float distancia = sqrt(pow(catetoAdyacente,2)+pow(catetoOpuesto,2));
    if(distancia <this.radio){
      this.velocidad.y*=-1;
    }
    
    PVector puntoInferiorMasCercano = new PVector(this.posicion.x,mesa.getPosicion().y+mesa.getAlto());
    
    if(this.posicion.x < mesa.getPosicion().x){
      puntoInferiorMasCercano.x=mesa.getPosicion().x;
    }
    if(this.posicion.x > mesa.getPosicion().x + mesa.getAncho()){
      puntoInferiorMasCercano.x=mesa.getPosicion().x+mesa.getAncho();
    }
    
    float catetoAdyacenteA= this.posicion.x-puntoInferiorMasCercano.x;
    float catetoOpuestoA = this.posicion.y - puntoInferiorMasCercano.y;
    float distanciaA = sqrt(pow(catetoAdyacenteA,2)+pow(catetoOpuestoA,2));
    if(distanciaA <this.radio){
      this.velocidad.y*=-1;
    }
  }
  
  public void rebotar(Jugador jugador){
    
    // 1) Inicialización de los puntos más cercanos al centro de la pelota desde el borde
    //    de las paletas
    
    PVector puntoPaletaIzquierdaMasCercano = new PVector();
    PVector puntoPaletaDerechaMasCercano = new PVector();
    
    if(jugador.getIdentificador()==Constantes.JUGADOR_IZQUIERDA){
      puntoPaletaIzquierdaMasCercano = new PVector(jugador.getPosicion().x+jugador.getAnchoPaleta(),this.posicion.y);
    }else{
      puntoPaletaDerechaMasCercano = new PVector(jugador.getPosicion().x,this.posicion.y);
    }
    
    // 2) Se determina el punto más cercano a la paleta en tiempo real
    
    if(jugador.getIdentificador()==Constantes.JUGADOR_IZQUIERDA){
      if(this.posicion.y < jugador.getPosicion().y){
        puntoPaletaIzquierdaMasCercano.y = jugador.getPosicion().y;
      }else{
        if(this.posicion.y > jugador.getPosicion().y + jugador.getAltoPaleta()){
          puntoPaletaIzquierdaMasCercano.y=jugador.getPosicion().y+jugador.getAltoPaleta();
        }
      }
    }else{
      if(this.posicion.y < jugador.getPosicion().y){
        puntoPaletaDerechaMasCercano.y = jugador.getPosicion().y;
      }else{
        if(this.posicion.y > jugador.getPosicion().y + jugador.getAltoPaleta()){
          puntoPaletaDerechaMasCercano.y=jugador.getPosicion().y+jugador.getAltoPaleta();
        }
      }
    }
    
   // 3) Se determina la distancia enre el centro de la pelota y el punto más cercano del borde de la paleta
   //    y se verifica si hay colisión actuando en conssecuencia
   
    if(jugador.getIdentificador()==Constantes.JUGADOR_IZQUIERDA){
      // la distancia se calcula mediante pitágoras
      float catetoAdyacente= this.posicion.x-puntoPaletaIzquierdaMasCercano.x;
      float catetoOpuesto = this.posicion.y - puntoPaletaIzquierdaMasCercano.y;
      float distancia = sqrt(pow(catetoAdyacente,2)+pow(catetoOpuesto,2));
      if(distancia < this.radio){
        this.velocidad.x*=-1;
      }
    }else{
      // la distancia se calcula mediante pitágoras
      float catetoAdyacente= puntoPaletaDerechaMasCercano.x-this.posicion.x;
      float catetoOpuesto = puntoPaletaDerechaMasCercano.y-this.posicion.y;
      float distancia = sqrt(pow(catetoAdyacente,2)+pow(catetoOpuesto,2));
      if(distancia < this.radio){
        this.velocidad.x*=-1;
      }
    }
    
  }
  
}
