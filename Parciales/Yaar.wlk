
class Barco {

    var mision 

    var capacidad

    var tripulantes = []

    method cantidadDeTripulantes() = tripulantes.size()
    
    method cumplirMision()

    method capacidad() = capacidad

    method tieneLugar() = self.cantidadDeTripulantes() < capacidad

    method agregarPirata(pirata) {
        if(pirata.puedeFormarParte(self))
        tripulantes.add(pirata)
    } 

    method echarInnecesarios() {
        tripulantes.removeaAllSuchThat { tripulante => mision.esUtil(tripulante).negate()}
    } 

    method cambiarMision(nuevaMision){
        mision = nuevaMision
        self.echarInnecesarios()
    }

    method pirataEsUtil(pirata) = mision.esUtil(pirata)

    method tripulantesConDinero(ciudad) = 
    tripulantes.filter{ tripulante => tripulante.puedePagarGrog(ciudad)}

    method elMasBorracho() =
    tripulantes.max {tripulante => tripulante.ebriedad()}
    
    method dejarAlBorracho(ciudad) {
        tripulantes.remove(self.elMasBorracho())
        ciudad.aumentarHabitantes()
    }

    method borrachera(ciudad) {
    const pudientes = self.tripulantesConDinero(ciudad)
    pudientes.forEach {tripulante => tripulante.comprarYtomar(ciudad)}
    }
    
    method anclarEn(ciudad) {
        self.borrachera(ciudad)
        self.dejarAlBorracho(ciudad)
    }

    method esTemible() = self.cumplirMision() && self.cantidadDeTripulantes() > 5
    
}
    
      


class Pirata {

    var items = []

    var property dinero  

    var property ebriedad

    method contiene(elemento) = items.contains(elemento)

    method ebriedadDeAlMenos(numero) = ebriedad >= numero

    method pasadoDeGrog() = self.ebriedadDeAlMenos(90) && self.contiene("botella de grogXD")

    method puedeFormarParte(barco) = barco.tieneLugar() && barco.pirataEsUtil(self)

    method puedePagarGrog(ciudad) = dinero > ciudad.precioGrog()

    method comprarYtomar(ciudad) {
        if(self.puedePagarGrog(ciudad))
        self.restarDinero(ciudad.precioGrog())
        self.aumentarEbriedadEn(5) 
    }

    method aumentarEbriedadEn(numero) {
        ebriedad = ebriedad + numero
    }

    method restarDinero(cantidad) {
        dinero = dinero - cantidad
    }
} 

class Mision {

    method esUtil(pirata) 

    method puedeSerRealizada(barco)

    method sonSuficientes(barco) = barco.capacidad() > barco.capacidad()*0.9

}


class ConvertirseEnLeyenda inherits Mision {

    var elementoLeyenda 
    
    method contiene10items(pirata) = pirata.items().size() >= 10 

    override method esUtil(pirata) = self.contiene10items(pirata) && pirata.contiene(elementoLeyenda)

    override method puedeSerRealizada(barco) = true 
}

class Saqueo inherits Mision {

    var victima 

    var monedasNecesarias 

    method cambiarMonedas(nuevaCantidad) {
        monedasNecesarias = nuevaCantidad
    }

    method contieneLaCantidad(pirata) = pirata.dinero() > monedasNecesarias

    override method esUtil(pirata) = self.contieneLaCantidad(pirata) && self.animaAsaquear(pirata,victima)  
 
    method animaAsaquear(pirata) =    

    override method puedeSerRealizada(barco) = victima.vulnerable(barco)
}

class CiudadCostera{

    const nombre

    var habitantes 

    var property precioGrog

    method aumentarHabitantes() {
        habitantes =+ 1
    }
}


class BusquedaDelTesoro inherits Mision {
    
    method contieneLosElementos(pirata) = 
    pirata.contiene("brujula") || 
    pirata.contiene("mapa") ||
    pirata.contiene("botella de grogXD") 

    method menosDeCincoMonedas(pirata) = pirata.dinero() < 5
    
    override method esUtil(pirata) = self.contieneLosElementos(pirata) && self.menosDeCincoMonedas(pirata)

    method unoTiene(elemento,barco) = barco.tripulacion().any { pirata => pirata.contiene(elemento)}
    
    override method puedeSerRealizada(barco) = self.unoTiene("llave de cofre",barco)
}

