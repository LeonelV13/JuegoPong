/**
  Representa la clase de la que se obtiene
  los jugadores del Pong
*/
class Jugador extends GameObject{
  // representa el puntaje actual del jugador
  private Integer puntaje;
  // sirve para indicar si es el jugador 1 o el jugador 2
  private Integer identificador;
  private int anchoPaleta;
  private int altoPaleta;
  
  /** Constructor Parametrizado */
  public Jugador(Integer puntaje, Integer identificador, PVector posicion,int anchoPaleta, int altoPaleta){
    this.puntaje = puntaje;
    this.identificador = identificador;
    this.posicion = posicion;
    this.anchoPaleta = anchoPaleta;
    this.altoPaleta = altoPaleta;
  }
  
  public void display(){
    strokeWeight(1.5);
    stroke(0);
    if(this.identificador == Constantes.JUGADOR_IZQUIERDA){
      fill(color(#0017FC));
      rect(posicion.x, posicion.y,this.anchoPaleta,this.altoPaleta);
    }
    
    if(this.identificador == Constantes.JUGADOR_DERECHA){
      fill(color(#FF0303));
      rect(posicion.x, posicion.y,this.anchoPaleta,this.altoPaleta);
    }
  }
  
  /** reacciones al uso de teclas */
  public void keyPressed(){
    int direccion=0;   
    // Jugador 1
    if(key=='w' && this.identificador == Constantes.JUGADOR_IZQUIERDA){
      direccion = 1;
    }
    if(key=='s' && this.identificador == Constantes.JUGADOR_IZQUIERDA){
      direccion = 3;
    }
    // Jugador 2
    if(keyCode==UP && this.identificador == Constantes.JUGADOR_DERECHA){
      direccion = 1;
    }
    if(keyCode==DOWN && this.identificador == Constantes.JUGADOR_DERECHA){
      direccion = 3;
    }
    
    mover(direccion);
  }
  
  /** Desplaza el jugador sobre el eje y  */
  public void mover(int direccion){
    float velocidadY=3;
    // para jugador 1
    if(direccion == 1){
      this.posicion.y -=velocidadY; 
      if(this.posicion.y < -60){
        this.posicion.y = height;
      }   
    }
    if(direccion == 3){
     this.posicion.y +=velocidadY; //this.posicion.x = this.posicion.x - velocidadX
      if(this.posicion.y > height){
        this.posicion.y =0;
      }   
    }
   display();   
  }
  
  public PVector getPosicion(){
    return posicion;
  }
  
  public int getIdentificador(){
    return this.identificador;
  }
  
  public int getAnchoPaleta(){
    return this.anchoPaleta;
  }
  
  public int getAltoPaleta(){
    return this.altoPaleta;
  }
  
}
