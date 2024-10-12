// Segunda parte --------------------------------

// Arsenal

class Espada {

    var portador  

    var multiplicador = 1

    var poder = 0    

    method cambiarPortador(nuevoPortador){
        portador = nuevoPortador
    }  

    method cambiarMultiplicador(nuevoMultiplicador){
        multiplicador = nuevoMultiplicador
    }
    method poder() = 
        if (portador.origen() == "élfico") {
            poder = 25*multiplicador
        } else if (portador.origen() == "enano") {
            poder = 20*multiplicador
        } else if (portador.origen() == "humano") {
            poder = 15*multiplicador 
        } else {
            poder = 10*(portador.cantidadDeArmas())  
        
}
}

class Daga inherits Espada {

    method poderDaga() = self.poder() / 2 

}

class Hacha {

    const longMango = 30
    const longHoja = 10

    method poder() =  longHoja*longMango  
}

class Baculo {
    var property poder 

    method poder() = poder

    method cambiarPoder(nuevoPoder) {
        poder = nuevoPoder
    }   
}

// Guerreros 
class Portador {

    var property origen 

    var property poder  

    var vida = 100

    var armas = []

    method origen() = origen

    method perderVida(cantidad){
        vida -= cantidad 
    }

    method cantidadDeArmas() = armas.size()

    method agregarArma(arma) {
        armas.add(arma)
    }

    method poderTotaldeArmas() = 
    armas.filter {arma => arma.poder()}
    .sum()

    method poder() = poder 

}

// Sobre los Guerreros

const nuevoBaculo = new Baculo(poder = 150)

// poder del hobbit = vida actual + CANTIDAD DE ARMAS*sumatoria de poder de las armas

// poder del enano = vida actual + FACTOR DE PODER*sumatoria de poder de las armas

// poder del elfos = vida actual + (DESTREZABASE + DESTREZAPROPIA)*sumatoria de poder de las armas

// poder del humanos = vida actual + 1/LIMITADOR DE PODER*sumatoria de poder de las armas

// 12/10. Ya con los maiar cambia, pero estos cuatro solo cambia una constante. Supongo que si ponemos el mismo metodo poder para todas las clases y solo cambia eso,
// para todas las clases, nos van a correr con repetición de lógica. La idea seria hacer un metodo que tenga una constante y segun el guerrero, podamos
// alterarla con otras variables propias del mismo. De test no tengo ni la mas puta idea.
class Hobbit inherits Portador {

    override method poder() = vida + self.cantidadDeArmas()*self.poderTotaldeArmas()
}
class Enano inherits Portador {

    var property factorDePoder 

    override method poder() = vida + factorDePoder*self.poderTotaldeArmas() 
}

class Elfo inherits Portador {

    var destrezaBase = 2

    var property destrezaPropia 

    method cambiarDestrezaBase(nueva){
        destrezaBase = nueva
    }

    override method poder() = vida + (destrezaBase + destrezaPropia)*self.poderTotaldeArmas()
}

class Humano inherits Portador{

    var property limitador 

    override method poder() = vida + self.poderTotaldeArmas() / limitador    
}

class Maiar inherits Portador{

    var factorBasico = 15

    var factorEnAmenaza = 300

    var bajoAmenaza = false 

    method cambiarFB(nuevo){
        factorBasico = nuevo
    }

    method cambiarFEA(nuevo){
        factorEnAmenaza = nuevo
    }

    method estaEnAmenaza(){
        bajoAmenaza = true 
    }

    method estaAsalvo(){
        bajoAmenaza = false 
    }

    method poderSegunFactor(factor) = vida + factor + 2*self.poderTotaldeArmas()

    override method poder() =
    if(bajoAmenaza) self.poderSegunFactor(factorBasico)
    else self.poderSegunFactor(factorEnAmenaza)  
}

