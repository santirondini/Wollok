
class Persona {

    var posicion 

    var elementos = ["aceite","sal","cuchillo"] 

    var esSordo   
    
    method posicion() = posicion

    method elementos() = elementos

    method moverme(nuevaPosicion){
        posicion = nuevaPosicion
    } 

    method cambiarPosicion(persona) {
        const miposicion = self.posicion()
        self.moverme(persona.posicion())
        persona.moverme(miposicion) 
    }

    method pedir(persona) {
    
    }

     




}

class Criterio{

    // pase comun 

    method pasar(elemento,persona) {
        persona.elementos().remove(elemento)
    }

    method pedirComun(persona1,persona2,elemento) {
        persona1.tieneEseElemento(elemento)
        persona2.elementos().add(elemento)
        persona1.pasar(elemento)
    }

    // pasar todos. Dejar comer tranquilo 

    method pasarTodo(emisor,receptor) {
        receptor.recibirElementos(emisor.elementos())
        emisor.elementos().clear()
    }

    method recibirElementos(receptor,nuevosElementos) {
        receptor.elementos().addAll(nuevosElementos)
    }
    
    //para mi se puede hacer de forma distinta

    method tieneEseElemento(emisor,elemento) = emisor.elementos().contain(elemento) 
}

// const nombre = new Clase ()
 