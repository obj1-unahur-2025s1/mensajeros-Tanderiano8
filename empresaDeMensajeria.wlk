import destinos.*
import mensajeros.*

object empresaDeMensajeria {
    const mensajeros = #{}
    const paquetesPendientes = []
    const paquetesEnviados = []
    method mensajeros() = mensajeros
    method contratarMensajero(unMensajero)  {mensajeros.add(unMensajero)}
    method despedirMensajero(unMensajero)   {mensajeros.remove(unMensajero)}
    method despedirTodosLosMensajeros()     {mensajeros.clear()}
    method mensajeriaEsGrande()            = mensajeros.size() > 2
    method puedeSerEntregadoPorElPrimero(unPaquete, unDestino) = if(not(mensajeros.isEmpty()))unPaquete.puedeEntregar(mensajeros.asList().first(), unDestino)
    method pesoDelUltimoMensajero() = if(not(mensajeros.isEmpty())) mensajeros.asList().last().peso()
    method puedeSerEntregadoPorLaEmpresa(unPaquete,unDestino) = mensajeros.any({m=> unPaquete.puedeEntregar(m,unDestino)})           
    method obtenerMensajerosQuePuedanLlevarUnPaqueteDado(unPaquete,unDestino) = mensajeros.filter({m=> unPaquete.puedeEntregar(m,unDestino)})
    method empresaTieneSobrepeso() = (mensajeros.sum({m=> m.peso()}) / mensajeros.size()) > 500   
    method enviarPaquete(unPaquete,unDestino) {if (self.obtenerMensajerosQuePuedanLlevarUnPaqueteDado(unPaquete,unDestino).isEmpty()) paquetesPendientes.add(unPaquete) else paquetesEnviados.add(unPaquete)}
    method facturacion() = paquetesEnviados.sum({p=>p.precio()})
    method enviarPendientes() {
        paquetesEnviados + paquetesPendientes
        paquetesPendientes.clear()
    }
    
}