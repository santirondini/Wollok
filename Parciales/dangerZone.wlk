
class Empleado{

    var salud = 100

    var habilidades = []

    var esJefeDe = []

    var saludCritica 

    method salud() = salud 

    method saludCritica() // metodo abstracto. Sirve para que lo entienda 

    method estaIncapacitado() = salud < self.saludCritica() // esto antes estaba asi: salud < saludCritica    

    method contieneLaHabilidad(habilidad) = habilidades.contains(habilidad)
    
    method puedeUsarHabilidad(habilidad) = self.estaIncapacitado().negate() && self.contieneLaHabilidad(habilidad)

    method reuneLasHabilidades(mision) =
    mision.habilidadesNecesiarias().all {habilidad => self.puedeUsarHabilidad(habilidad)}  

    method cumplirMision(mision) =
    self.reuneLasHabilidades(mision)
    

    method restarVida(mision) {
        if(salud > mision.peligrosidad() )
        salud =- mision.peligrosidad()
        else 
        salud = 0 
    }
    
    method registrarMision(mision)
    
    method realizarMision(mision) {
        if(self.cumplirMision(mision)) 
        self.restarVida(mision)
        self.consecuenciaDeMision(mision)
    }

    method consecuenciaDeMision(mision) 
}


class Mision {

    var habilidadesNecesiarias = []

    const peligrosidad 

    method peligrosidad() = peligrosidad

    method habilidadesNecesiarias() = habilidadesNecesiarias 

    method agregarHabilidad(habilidad) = habilidadesNecesiarias.add(habilidad)
}

class Espia inherits Empleado {

    override method saludCritica() = 15

    method noPertenece(habilidad) = habilidades.contains(habilidad).negate()

    method habilidadesNuevas(mision) {
        const nuevas = mision.habilidadesNecesiarias().filter {habilidad => self.noPertenece(habilidad)}
        return nuevas 
    }
    
    override method consecuenciaDeMision(mision){
    const nuevas = self.habilidadesNuevas(mision)
    habilidades = habilidades + nuevas 
    }
}

// Cuando un oficinista junta tres estrellas adquiere la suficiente experiencia como para empezar a trabajar de espía. ==> VER

class Oficinista inherits Empleado {

    var estrellas 

    override method registrarMision(mision) {
        estrellas = estrellas + 1 
    }

    method estrellas() = estrellas

    method sumarEstrella() {
        estrellas =+ 1
    }

    method tieneTresEstrellas() = estrellas > 3 

    method serEspia() = {
        
    }

    override method saludCritica() = 40 - 5*estrellas

    override method consecuenciaDeMision(mision) {
        self.sumarEstrella()
    }
}

class Equipo {

    var integrantes = []
    
    method cumplenLaMision(mision) = 
    integrantes.any {integrante => integrante.cumplirMision(mision)}

    method restarVida(mision) {
    const perdida = mision.peligrosidad() / 3
    integrantes.forEach { integrante => integrante.salud() - perdida}
    integrantes.removeAllSuchThat {integrante => integrante.salud() == 0}
    }

    method realizarMision(mision) {
        if (self.cumplenLaMision(mision)) 
        self.restarVida(mision) 
        
    }    
}
