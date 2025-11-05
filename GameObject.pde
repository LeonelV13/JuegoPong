
abstract class GameObject{
  
  protected PVector posicion;
  
  public GameObject(){
    posicion = new PVector();
  }
  
  public GameObject(PVector posicion){
    this.posicion = posicion;
  }
  
  public abstract void display();
  
  public PVector getPosicion(){
    return this.posicion;
  }
  
  public void setPosicion(PVector posicion){
    this. posicion = posicion;
  }
}
