
class Personaje {

    var property casa

    var property conyuges 

    method esMonogamico() = conyuges.size() < 1

    method puedeCasarseCon(posibleCoyunge) =
    posibleCoyunge.casa().restriccionesParaCasamiento(self)
}

const feli = new Personaje(casa = casaLanister, conyuges = [])

const casaLanister = new Casa(integrantes = [feli], patrimonio = 10000, nombreCiudad = "Buenos Aires", nombreDeCasa = lannister)

const casaStark = new Casa(integrantes = [mica], patrimonio = 440000, nombreCiudad = "Comodoro Rivadavia", nombreDeCasa = stark)

const mica = new Personaje(casa = casaStark, conyuges = [])


class Casa {

    var property integrantes 
    
    var property patrimonio

    var property nombreCiudad

    var property nombreDeCasa

    method restriccionesParaCasamiento(posibleConyuge) {
        nombreDeCasa.condicionParaCasamiento(self,posibleConyuge)
    }
}

object lannister {
    
    method condicionParaCasamiento(persona,posibleConyuge) =
    persona.esMonogamico()
}

object stark {

    method compartenCasa(persona,posibleConyuge) =
    persona.casa() == posibleConyuge.casa()
    
    method condicionParaCasamiento(persona,posibleConyuge) =
    not self.compartenCasa(persona,posibleConyuge)
}

object deLaGuardia {

    method condicionParaCasamiento(casa,posibleCoyunge) = true 
}


