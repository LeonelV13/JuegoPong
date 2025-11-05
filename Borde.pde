
class Borde extends GameObject {
  private int ancho;
  private int alto;
  private color colorBorde;
  
  public Borde(PVector posicion, int ancho, int alto, color colorBorde){
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
    this.colorBorde = colorBorde;
  }
  
  public void display(){
    stroke(0);
    fill(this.colorBorde);
    rect(posicion.x,posicion.y,this.ancho,this.alto  );
  }
}
