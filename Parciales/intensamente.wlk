

class Chica {

    var property felicidad = 1000

    var property emociones = []
    
    var property emocionDominante

    var property coeficienteDeFelicidad

    var property recuerdosDelDia = []

    var property pensamientoCentrales = []

    method coeficienteDeFelicidadBajo() = coeficienteDeFelicidad < 1

    method vivirEvento(evento) {
        evento.consecuenciasDeEvento(self)
        recuerdosDelDia.add(evento)
    }

    method recuerdosRecientes() = recuerdosDelDia.take(5)

    method conocerPensamientosCentrales() = pensamientoCentrales.asSet()

    method pensamientoCentralesComplicados() =
    self.conocerPensamientosCentrales().filter { pensamiento => pensamiento.dificilDeExplicar()}

}

const riley = new Chica(emociones = [alegria], emocionDominante = alegria, coeficienteDeFelicidad = 15)

const pesadilla = new Recuerdo(descripcion = "pesadilla gay",fecha = 20050425)


class Recuerdo { 

    var descripcion

    var fecha

    method dificilDeExplicar() = descripcion.size() > 10

    method emocionDominanteEnElMomento(persona) =
    persona.emocionDominante() 

    method consecuenciasDeEvento(persona) {
        self.emocionDominanteEnElMomento(persona).respuestaAlEvento(self, persona)
        persona.recuerdosDelDia().add(self)
    } 
}


object alegria {

    method condicion(persona) = persona.felicidad() > 500
    
    method respuestaAlEvento(evento,persona) {
    if(self.condicion(persona))
    persona.pensamientoCentrales().add(evento)     
    }
}


object tristeza{

    method respuestaAlEvento(evento,persona) {
        persona.pensamientoCentrales().add(evento)
        persona.coeficienteDeFelicidad(persona.coeficienteDeFelicidad()*0.9)
        if(persona.coeficienteDeFelicidadBajo())
        self.error("El coeficiente de felicidad esta bajo. Ir a terapia")
    }

}

object disgusto {

    method respuestaAlEvento(evento,persona) {}
}

object temeroso {
    method respuestaAlEvento(evento,persona) {}
}

object furia {
    method respuestaAlEvento(evento,persona) {}
}