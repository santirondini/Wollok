
class Persona {

    var property posicion 

    var property criterioAsociado 

    var property elementosCerca = []

    var comidasIngeridas = []

    var criterioParaComer

    method criterioParaPasarlaBien()

    method contieneElElemento(elemento) = elementosCerca.contains(elemento)

    method pedir(persona,elemento){
        if(persona.contieneElElemento(elemento)) {
        persona.criterioAsociado().dar(persona,self,elemento)
        }
    }

    method cambiarCriterio(nuevoCriterio){
        criterioAsociado = nuevoCriterio
    }

    method ingerirComida(comida) {
        comidasIngeridas.add(comida)
    }

    method comerDeLaBandeja(bandeja) {
        criterioAsociado.comerBandeja(self,bandeja)
    }

    method estaPipon() =
    comidasIngeridas.any{comida => comida.esPesada()}

    method laEstaPasandoBien() = (not comidasIngeridas.isEmpty()) && self.criterioParaPasarlaBien()

}

class Osky inherits Persona{

    override method criterioParaPasarlaBien() = true 
}

class Moni inherits Persona{

    override method criterioParaPasarlaBien() = posicion == 1 
}

class Facu inherits Persona{

    method comioCarne() = 
    comidasIngeridas.any {comida => comida.esCarne()}
    
    override method criterioParaPasarlaBien() =
    self.comioCarne() 
}

class Vero inherits Persona{

    method noTieneMasDe3elementosCerca() =
    elementosCerca.size() <= 2
    
    override method criterioParaPasarlaBien() = self.noTieneMasDe3elementosCerca() 
}



// Criterios para dar

object sonSordos {

    method dar(otorgador, receptor, elemento) {
        const primerElemento = otorgador.elementosCerca().first()
        receptor.elementosCerca().add(primerElemento)
        otorgador.elementosCerca().remove(primerElemento)
        }
}

object comerTranquilo {
    
    method dar(otorgador, receptor, elemento) {
        var elementos []
        elementos = otorgador.elementosCerca()
        receptor.elementosCerca().addAll(elementos)
        otorgador.elementosCerca().clear()
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


// Punto 2)

class Bandeja {

    var comida = []
}

class Comida {

    var nombre 

    var kcal 

    var esCarne  

    method esPesadad() = kcal > 500  
}

// Criterio 

class Criterio {

    method condicion(comida) // comida individuales

    method comer(persona,comida) // acción para comer

    method comerBandeja(persona,bandeja) {
        bandeja.map {comidaDeLaTabla => self.comer(persona,comidaDeLaTabla)} 
    }
}

class Vegetariano inherits Criterio{

    override method condicion(comida) = not comida.esCarne()
    
    override method comer(persona,comida) {
        if(self.condicion(comida))
        persona.ingerirComida(comida)
        else
        self.error("La persona es vegetariana. No come carne") 
        }
}

class CombinacionDeCriterios inherits Criterio{

    var criterios = []

    method todosLosCriteriosSeCumplen(comida) =
    criterios.all{criterio => criterio.condicion(comida)}

    override method comer(persona,comida) {
        if(self.todosLosCriteriosSeCumplen(comida))
        persona.ingerirComida(comida)
    } 

}

class Dietetico inherits Criterio {

    override method condicion(comida) = comida.kcal() < 500
    
    override method comer(persona,comida) {
    if(self.condicion(comida))
    persona.ingerirComida(comida)
    }    
}

class Alternado inherits Criterio {

    override method comerBandeja(persona,bandeja) {
        var alternar = true
        bandeja.forEach { comida =>
            if (alternar) {
                persona.ingerirComida(comida)
            }
            alternar = !alternar
        }
    }    
}


// Punto 3)