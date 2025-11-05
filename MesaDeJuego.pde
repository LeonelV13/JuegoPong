/**
 Representa la clase de la que se obtiene
 la mesa donde se juega el pong
 */
class MesaDeJuego extends GameObject {
  /**representa el color de la mesa*/
  private color colorMesa;
  /** representa el ancho de la mesa*/
  private Integer ancho;
  /**representa el alto de la mesa*/
  private Integer alto;
  /**representa los bordes de la mesa*/
  private Borde[] bordes;

  /** Constructor por defecto*/
  public MesaDeJuego() {
    colorMesa = color(13, 126, 19); // asigno un color a la mesa
    this.ancho = 500; // defino el valor ancho de la mesa
    this.alto = 300;  // defino el valor del alto de la mesa
    this.posicion = new PVector(50, 100); // establezco la posición de la mesa en el juego
    // creo los bordes de la mesa
    bordes = new Borde[2];
    bordes[0] = new Borde(new PVector(this.posicion.x, this.posicion.y-15), this.ancho, Constantes.ALTO_BORDE, color(160, 118, 76));
    bordes[1] = new Borde(new PVector(this.posicion.x, this.posicion.y+this.alto+5), this.ancho, Constantes.ALTO_BORDE, color(160, 118, 76));
  }

  /** Dibuja la mesa en el lienzo del juego*/
  public void display() {
    // Arreglo efecto de estela
    noStroke();
    fill(180, 255);
    rect(0, 0, width, height);
    // dibujo la mesa
    fill(#070808);
    for (int x = 5; x<=width; x=x+10) {
      for (int y =5; y<=height; y=y+10) {
        ellipse(x, y, 6, 6);
      }
      ellipse(x, 5, 6, 6);
    }
    fill(this.colorMesa);
    strokeWeight(4);
    stroke(255);
    rect(posicion.x, posicion.y, this.ancho, this.alto);
    //line(posicion.x, this.alto/2+posicion.y, this.ancho+posicion.x, this.alto/2+posicion.y);
    //stroke(255, 255, 0);
    circle(width/2, height/2, 80);
    for (int y=(int)posicion.y; y <= this.alto+posicion.y; y+=10) {
      line(posicion.x+this.ancho/2, y, posicion.x+this.ancho/2, y+5);
    }
    // Dibuja los Bordes
    for (Borde b : bordes) {
      b.display();
    }
  }

  // zona de métodos accesores //

  public int getAncho() {
    return this.ancho;
  }

  public PVector getPosicion() {
    return this.posicion;
  }

  public int getAlto() {
    return this.alto;
  }
}
