MesaDeJuego mesa;
Jugador roger;
Jugador rafa;
Pelota pelota;

/**Se ejecuta al inicio por única vez, usado para configuración inicial*/
void setup(){
  size(600,500);
  mesa = new MesaDeJuego();
  roger = new Jugador(0,Constantes.JUGADOR_IZQUIERDA,new PVector(50,220),20,60);
  rafa = new Jugador(0,Constantes.JUGADOR_DERECHA, new PVector(530,220),20,60);
  pelota = new Pelota();
}


/** Redibuja el lienzo constantemente y ejecuta su contenido*/
void draw(){
  mesa.display();
  //roger.display();
  //rafa.display();
  roger.keyPressed();
  rafa.keyPressed();
  //pelota.display();
  pelota.rebotar(mesa);
  pelota.mover();
  pelota.rebotar(roger);
  pelota.rebotar(rafa);
}
