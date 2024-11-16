
class Persona{

    var edad
    var carreras = [] // lo que quiere estudiar
    var titulosUniversitarios = [] // lo que estudio 
    var lugaresAviajar = []
    var hijos = []
    var sueniosCumplidos = []
    var sueniosPendientes = []
    var tipoDePersona
    var felicidad 

    var property trabajo
    var property sueldoDeseado

    method cambiarPersonalidad(nuevaPersonalidad) {
        tipoDePersona = nuevaPersonalidad 
    }

    method esPendiente(suenio) = sueniosPendientes.contais(suenio)
    
    method moverDePendienteACumplido(suenio) {
        sueniosPendientes.remove(suenio)
        sueniosCumplidos.add(suenio)
    }
    
    method dePendienteACumplido(suenio) {
        if(self.esPendiente(suenio))
        self.moverDePendienteACumplido(suenio)
    }

    method aumentarFelicidad(suenio){
        felicidad =+ suenio.felicidad()
    }
    
    method cumplirSuenio() {
        const suenio = tipoDePersona.suenio(self)
        if(suenio.condicion(self)) {
        suenio.cumplir(self)
        self.dePendienteACumplido(suenio)
        self.aumentarFelicidad(suenio)
        }
        else 
        self.error("El sueño no puede cumplirse")
    }

    method felicidadDeSueniosPendientes() {
        return sueniosPendientes.map { suenio => suenio.felicidad() }.sum()
    }

    method estaFeliz() = felicidad > self.felicidadDeSueniosPendientes()
    
    method esAmbiciosa 
}

// Que puedan aparecer nuevos tipos de personas, se refiere a que es una caracteristica que tiene que tener la clase persona?
// Entonces no hace falta que se hereden cosas? 

object realista{

    method masImportante(persona) {
        return persona.sueniosPendientes().max {suenio => suenio.felicidad()}
    }
    
    method suenio(persona) {
        return self.masImportante(persona)
    }
}

object alocado{

    method suenio(persona) {
        return persona.sueniosPendientes().anyOne()
    }
}

object obsesivo{

    method suenio(persona){
        return persona.sueniosPendientes().head()
    }
    
}
class Suenio{

    method condicion(persona)

    method cumplir(persona) 

    var property felicidad 

    method masDe100Felicidonios() = felicidad > 100
}

class Recibirse inherits Suenio{

    var carrera 

    method quiereEstudiarEsaCarrera(persona) =
    persona.carreras().contains(carrera)

    method noSeRecibio(persona) =
    not persona.titulosUniversitarios().contains(carrera)
    
    override method condicion(persona) =
    self.quiereEstudiarEsaCarrera(persona) && self.noSeRecibio(persona)

    method sumaTitulo(persona) {
        persona.carreras().remove(carrera)
        persona.titulosUniversitarios().add(carrera)
    }

    override method cumplir(persona) {
        self.sumaTitulo(persona)
    }
}

const recibirseIngeniero = new Recibirse(felicidad = 10,carrera = "Ingenieria en sistemas")

class TenerHijo inherits Suenio{
 
    var hijo

    override method cumplir(persona) {
        persona.hijos().add(hijo)
    }
}

class AdoptarHijos inherits Suenio{

    var hijos = []

    override method condicion(persona) =
    persona.hijos().isEmpty() 
    
    override method cumplir(persona) {
    persona.hijos().addAll(hijos)
    } 
}


class Viajar inherits Suenio {
    
    var lugar

    override method condicion(persona) =
    persona.lugaresAviajar().contains(lugar)

    override method cumplir(persona){
        
    }
}

class ConseguirLaburo inherits Suenio{

    var sueldo

    var nombreDeLaburo

    override method condicion(persona) = persona.sueldoDeseado() > sueldo

    method anotarLaburo(persona) {
        persona.trabajo(nombreDeLaburo)
    }

    override method cumplir(persona) {
        self.anotarLaburo(persona)
    }
}

/*
Esto produce un error. No hace falta considerar el estado en el que queda la persona al ir cumpliendo sueños 
(ej: tener 1 hijo, adoptar 1 hijo podría tirar error por separado pero no si participan de un sueño múltiple)

*/

// SUEÑO MULTIPLE 

class SuenioMultiple inherits Suenio {

    var listaDeSuenios = []

    override method condicion(persona) =
    listaDeSuenios.all { suenio => suenio.condicion(persona)}

    override method cumplir(persona) {
    listaDeSuenios.forEach{ suenio => suenio.cumplir(persona)}
    }

}

