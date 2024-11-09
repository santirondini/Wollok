

class Empleado{

    var salud 

    var habilidades = []

    var esJefeDe = []

    var saludCritica 

    method salud() = salud 

    method saludCritica() 

    method incapacitado() = salud < saludCritica    

    method contieneLaHabilidad(habilidad) = habilidades.contains(habilidad)
    
    method puedeUsarHabilidad(habilidad) = self.incapacitado().negate() && self.contieneLaHabilidad(habilidad)

    method cumplirMision(mision) =
    mision.habilidadesNecesiarias().all {habilidad => self.puedeUsarHabilidad(habilidad)}  

    method restarVida(mision) {
        salud =- mision.peligrosidad()
    }
    
    method registrarMision(mision)
    
    method realizarMision(mision) {
        if(self.cumplirMision(mision)) 
        self.restarVida(mision)
        self.registrarMision(mision)
    }

    
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
    
    override method registrarMision(mision){
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

    override method saludCritica() = 40 - 5*estrellas
}

class Equipo {

    var integrantes = []
    
    method cumplenLaMision(mision) = 
    integrantes.any {integrante => integrante.cumplirMision(mision)}

    method restarVida(mision) {
    const perdida = mision.peligrosidad() / 3
    integrantes.forEach { integrante => integrante.salud() - perdida}
    }
    
    method realizarMision(mision) {
        if (self.cumplenLaMision(mision)) 
        self.restarVida(mision) 
    }    
}