class Persona {

    var property posicion 

    var criterioAsociado 

    var elementosCerca 

    method contieneElElemento(elemento) = elementosCerca.contains(elemento)

    method pedir(persona,elemento){
        if(persona.contieneElElemento(elemento)) {
        criterioAsociado.dar(persona,self,elemento)
        } else self.error("la persona no contiene el elemento")
    }

    method cambiarCriterio(nuevoCriterio){
        criterioAsociado = nuevoCriterio
    }
}



const guido = new Persona(elementosCerca = ["tenedor","cuchillo","una peronista"],criterioAsociado = comerTranquilo, posicion = 3 )
const santino = new Persona(elementosCerca = ["mate","carne","cordero","termo"], criterioAsociado = sonSordos, posicion = 10 )

object sonSordos {

    method dar(otorgador, receptor, elemento) {
        const primero = otorgador.elementosCerca().head()
        otorgador.elementosCerca().remove(primero)
        receptor.elementosCerca().add(primero)
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

