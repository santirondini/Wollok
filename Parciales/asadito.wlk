class Persona {

    var posicion

    method posicion() = posicion

    method cambiarPosicion(nueva) {
        posicion = nueva
    } 

    var criterioAsociado 

    var elementosCerca = []

    method contieneElElemento(elemento) = elementosCerca.contains(elemento)

    method pedir(persona,elemento){
        if(persona.contieneElElemento(elemento)) {
        criterioAsociado.dar(persona,self,elemento)
        }
    }

    method cambiarCriterio(nuevoCriterio){
        criterioAsociado = nuevoCriterio
    }
}

object sonSordos {

    method dar(otorgador, receptor, elemento) {
        const primero = otorgador.elementosCerca().first()
        receptor.elementosCerca().add(primero)
        otorgador.elementosCerca().remove(primero)
    }
}

object comerTranquilo {
    
    method dar(otorgador, receptor, elemento) {
        receptor.elementosCerca().addAll(receptor.elementosCerca())
    }
}

object intercambianPosiciones {
    
    method dar(otorgador, receptor, elemento) {
        var tempPosicion = otorgador.posicion()
        otorgador.posicion(receptor.posicion())
        receptor.posicion(tempPosicion)
    }
}

object normal {

    method dar(otorgador,receptor,elemento) {
    otorgador.elementosCerca().remove(elemento)
    receptor.elementosCerca().add(elemento)
    }
}

const mateo = new Persona(criterioAsociado = normal, posicion = 3, elementosCerca = [])