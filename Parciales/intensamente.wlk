

class Chica {

    var property felicidad = 1000

    var property emociones = []
    
    var property emocionDominante

    var property coeficienteDeFelicidad

    var property recuerdosAsenatdos = []

    var property recuerdosDelDia = []

    var property pensamientoCentrales = []

    method coeficienteDeFelicidadBajo() = coeficienteDeFelicidad < 1

    method vivirEvento(evento) {
        evento.consecuenciasDeEvento(self)
        recuerdosDelDia.add(evento) // asentar evento 
    }

    method elRecuerdoExiste(recuerdo) =
    recuerdosAsenatdos.contains(recuerdo)
    
    method niegaUnRecuerdo(recuerdo) {
    if(emocionDominante.niega(recuerdo,self))
    self.error("La emoción dominante negó el recuerdo")
    }

    method asentarRecuerdos() {
        recuerdosAsenatdos.addAll(recuerdosDelDia)
    }

    method irAdormir() {

    }

    method asentarConPalabrac

    method recuerdosRecientes() = recuerdosDelDia.take(5)

    method conocerPensamientosCentrales() = pensamientoCentrales.asSet()

    method pensamientoCentralesComplicados() =
    self.conocerPensamientosCentrales().filter { pensamiento => pensamiento.dificilDeExplicar()}
}

object asentamiento {

    
}

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

class Emocion {

    method respuestaAlEvento(evento,persona)
    
    method niega(recuerdo,persona)
}

const alegria = new Alegria()
const tristeza = new Tristeza() 
const furia = new Furia()
const disgusto = new Disgusto()
const temor = new Temor()


class Alegria inherits Emocion {

    method condicion(persona) = persona.felicidad() > 500
    
    override method respuestaAlEvento(evento,persona) {
    if(self.condicion(persona))
    persona.pensamientoCentrales().add(evento)     
    }

    override method niega(recuerdo,persona) =
    not recuerdo.emocionDominanteEnElMomento(persona) == self 

}


class Tristeza inherits Emocion {

    override method niega(recuerdo,persona) =
    recuerdo.emocionDominanteEnElMomento(persona) == alegria 

    override method respuestaAlEvento(evento,persona) {
        persona.pensamientoCentrales().add(evento)
        persona.coeficienteDeFelicidad(persona.coeficienteDeFelicidad()*0.9)
        if(persona.coeficienteDeFelicidadBajo())
        self.error("El coeficiente de felicidad esta bajo. Ir a terapia")
    }

}

class Temor inherits Emocion {

    override method respuestaAlEvento(evento,persona) {}

    override method niega(recuerdo,persona) = false
}

class Disgusto inherits Emocion {
    override method respuestaAlEvento(evento,persona) {}

    override method niega(recuerdo,persona) = false
}

class Furia inherits Emocion {
    override method respuestaAlEvento(evento,persona) {}

    override method niega(recuerdo,persona) = flase 
}