import dragonBallZ.*

class Fiesta{
    
    var lugar 

    var fechaFiesta //AAAAMMDD
 
    var invitados = []

    method todosDisconformes() =
    invitados.all{invitado => not invitado.estaSatisfechoConDisfraz()}
    
    method esUnBodrio() = self.todosDisconformes()

    method mejorDisfraz() =
    invitados.map{invitado => invitado.disfraz()}
    .max{disfraz => disfraz.puntuacion()}

    method cambianTrajes(invitado1,invitado2) {
        var percha = invitado1.disfraz()
        invitado1.disfraz(invitado2.disfraz())  
        invitado2.disfraz(percha)
    }

    method estanConformes(invitado1,invitado2) = invitado1.estaSatisfechoConDisfraz() && invitado2.estaSatisfechoConDisfraz()

    method algunoDisconforme(invitado1,invitado2) = 
    invitado1.estaSatisfechoConDisfraz() != invitado2.estaSatisfechoConDisfraz()
    
    method estanEnLaFiesta(invitado1,invitado2) = invitados.contains(invitado1) && invitados.contains(invitado2)
    
    method conformesCuandoCambian(invitado1,invitado2) {
        self.cambianTrajes(invitado1, invitado2)
        return self.estanConformes(invitado1, invitado2)
    }
    
    method puedenIntercambiarDisfraces(invitado1,invitado2) =
    self.estanEnLaFiesta(invitado1, invitado2) && 
    self.algunoDisconforme(invitado1, invitado2) &&
    self.conformesCuandoCambian(invitado1, invitado2)

    method tieneDisfraz(persona) = persona.disfraz()

    method noEstaCargado(persona) = not invitados.contains(persona)

    method cumpleCondiciones(persona) = self.tieneDisfraz(persona) && self.noEstaCargado(persona)
    
    method agregarInvitado(persona) {
        if(self.cumpleCondiciones(persona))
        invitados.add(persona)
        else
        self.error("La persona no puede ser cargada")
    }

    method todosSexysYConformes() = 
    invitados.all {invitado => invitado.esSexy() && invitado.estaSatisfechoConDisfraz()}

    method esInolvidable() =
    self.todosSexysYConformes() 
}

class Persona {
    
    var nombre

    var property edad
    
    var property disfraz

    var personalidad 

    var paraCambiante

    method cambia(){
        paraCambiante = !paraCambiante
    }

    method esSexy() = 
    personalidad.esSexy(self) 

    method traje10puntos() = disfraz.puntuacion() > 10 

    method estaSatisfechoConDisfraz() = self.traje10puntos() && self.condicionEspecial() 

    method condicionEspecial()
}

// TIPOS DE PERSONAS: NO CAMBIAN

class Caprichoso inherits Persona{

    override method condicionEspecial() = disfraz.nombre().size() % 2 == 0 
}

class Pretencioso inherits Persona {

    var fechaActual // Puedo tambien asociar a una persona, una fiesta y sacar la fecha de la fiesta

    override method condicionEspecial() = disfraz.fechaConfeccion() - fechaActual <= 30 
}

class Numerologo inherits Persona{

    var cifraDelNumerologo

    override method condicionEspecial() = disfraz.puntuacion() == cifraDelNumerologo
}

// PERSONALIDADES 

object alegre {

    method esSexy(persona) = false
}

object taciturna {

    method esSexy(persona) = persona.edad() < 30
 }

object cambiante {

    method esSexy(persona) {
        persona.cambia()
        return persona.paraCambiante()
    }
}

// DISFRAZ

class Disfraz {

    var nombre

    var fiestaAsociada 

    var portador

    var fechaConfeccion //AAAAMMDD

    var fechaCompra //AAAAMMDD

    var nivelDeGracia

    var careta

    var caracteristica 

    method puntuacion() =
        caracteristica.puntuacion(self)
    
    
}

// CARACTERISTICAS

class CombinacionDeCaracteristicas {

    var listaDeCaracteristicas = []

    var sumaDePuntuaciones = 0

    method puntuacion(disfraz) {
        listaDeCaracteristicas.forEach{ caracteristica =>
        sumaDePuntuaciones =+ caracteristica.puntuacion(Disfraz)
    } return sumaDePuntuaciones 
    }
}

object gracioso {

    method puntuacion(disfraz) =
    if(disfraz.fechaConfeccion() < 50)
    disfraz.nivelDeGracia()
    else
    disfraz.nivelDeGracia()*3
}

object tobaras {

    method puntuacion(disfraz) =
    if(disfraz.fiestaAsociada().fechaFiesta() - disfraz.fechaCompra() <= 2) 
    return 5 
    else 
    return 3
}

object caretas {

    method puntuacion(disfraz) =
    if(disfraz.careta() == "Mickey Mouse")
    return 8
    else 
    return 6    
}

object sexies {

    method puntuacion(disfraz) =
    if(disfraz.portador().esSexy()) 
    return 15
    else
    return 2
}