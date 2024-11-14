
class Persona {

    var posicion 

    var criterioAsociado

    var elementosCerca = ["sal", "aceite","vinagre" , "aceto", "oliva", "cuchillo que corta bien"]

    method dar(elemento,persona) {
        
    }

    method pedir(persona,elemento){
    
    }

    method cambiarCriterio(nuevoCriterio){
        criterioAsociado = nuevoCriterio
    }
}

// Criterios para dar

object sonSordos {

    var personaConCriterio 

    method dar(elemento,persona) {
        const primerElemento = personaConCriterio.elementosCerca().head()
        personaConCriterio.elementosCerca().remove(primerElemento)
        persona.elementosCerca().add(primerElemento)
    }
}

object comerTranquilo {

}

object intercambianPosiciones{

}

object normal {

}
