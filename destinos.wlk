import mensajeros.*

object brooklyn {
    method puedePasar(unMensajero) = unMensajero.peso() <= 1000 
}

object matrix {
    method puedePasar(unMensajero) = unMensajero.puedeLlamar()  
}
