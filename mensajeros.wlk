import destinos.*


object roberto {
    var property vehiculoActual = bicicleta
    method peso() = 90 + vehiculoActual.peso()
    method puedeLlamar() = false
    method esHibrido() = false
}

object chuckNorris {
    method peso() = 80
    method puedeLlamar() = true
    method esHibrido() = true
}

object neo {
    var tieneCredito = true
    method peso() = 0
    method puedeLlamar() = true
    method cambiarCredito () {tieneCredito = not tieneCredito}  
    method esHibrido() = tieneCredito
}
object bicicleta {
    method peso() = 5
}

object camion {
    var cantidadDeAcoplados = 0

    method peso() = cantidadDeAcoplados * 500

    method cantidadDeAcoplados(unaCantidad){
        cantidadDeAcoplados = unaCantidad
    }
    method cantidadDeAcoplados() = cantidadDeAcoplados
}



object paquete{
    var pagado = 0
    method pagado(cantidad) {pagado += cantidad}
    method precio() = 50
    method estaPago() = self.precio() <= pagado
    method puedeEntregar(unMensajero,enDestino) = self.estaPago() and enDestino.puedePasar(unMensajero)
}

object paquetito {
    method estaPago() = true
    method precio() = 0
    method puedeEntregar(unMensajero,enDestino) = self.estaPago() and enDestino.puedePasar(unMensajero)
}

object paquetonViajero{
    var pagado = 0
    method pagado(cantidad) {pagado += cantidad}
    method precio() = 200
    method estaPago() = self.precio() <= pagado
    method puedeEntregar(unMensajero,enDestino) = self.estaPago() and enDestino.puedePasar(unMensajero) and unMensajero.esHibrido()
}