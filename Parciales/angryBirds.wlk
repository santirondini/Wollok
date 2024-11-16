import suenios.*

object islaPajaro {
    var pajaros = []

    method pajarosFuertes() =
    pajaros.filter {pajaro => pajaro.esFuerte()}

    method fuerzaDeIsla() =
    self.pajarosFuertes().map {pajaro => pajaro.fuerza()}.sum()

    method sucedeEvento(evento) {
        evento.consecuencias(pajaros)
    }

    method agregarPajaro(pajaro){
        pajaros.add(pajaro)
    }

    method esHabitante(pajaro) = pajaros.contains(pajaro)

    method puedeRecuperarLosHuevos(pajaro) =
    islaCerdito.obstaculos.all{obstaculo => pajaro.puedeDerribarObstaculo(obstaculo)}
    
    method atacarIslaCerditoCon(pajaro) {
        if(self.puedeRecuperarLosHuevos(pajaro))
        islaCerdito.obstaculos.removeAll()
        else
        self.error("El pajaro no puedo derribar todos los obstaculos :(")
    }
}

object islaCerdito {

    var obstaculos = []


}

// EVENTOS.

object sesionDeManejo {
    
    method consecuencias(pajaros) {
    pajaros.filter{pajaro => pajaro.puedeTranquilizarse()}
    .forEach { pajaro => pajaro.disminuirIraEn(5)}
    }
}

class InvasionDeCerditos {

    var cantidadDeCerditos
    
    method consecuencias(pajaros) {
    const aumentoPorCerditos = cantidadDeCerditos / 100
    pajaros.forEach{ pajaro => pajaro.aumentarIraEn(aumentoPorCerditos)}
    }
}

class FiestaSopresa {

    var homenajeados = []

    method hayHomenajeados(pajaros) =
    not homenajeados.isEmpty()

    method enojarAhomenajeados(pajaros) {
        pajaros.filter{pajaro => homenajeados.contains(pajaro)}
        .forEach {homenajeado => homenajeado.enojarse()}
    }
    
    method consecuencia(pajaros) {
        if(self.hayHomenajeados(pajaros))
        self.enojarAhomenajeados(pajaros)
        else
        self.error{"ERROR: No hay homenjeados"}
    }
}

class EventosDesafortunados {

    var eventos = []

    method consecuencia(pajaros) {
    eventos.forEach{evento => evento.consecuencia(pajaros)}
    } 
}

// CLASE PAJARO

class Pajaro {

    var ira

    method puedeTranquilizarse() = true

    var enojado = false
    
    var cantidadDeEnojos
    
    method enojarse(){
        enojado = true 
        cantidadDeEnojos=+1
    }

    method disminuirIraEn(unidad) {
        ira = ira - unidad
    }

    method aumentarIraEn(unidad) {
        ira = ira + unidad
    }
    
    method fuerza() = ira*self.constanteDePajaro()

    method constanteDePajaro()

    method esFuerte() = self.fuerza() > 50

    method puedeDerribarObstaculo(obstaculo) = self.fuerza() > obstaculo.resistencia()

}

/*
Otra opción:

class Obstaculo {
    method resistencia() 
}

class Pared inherits Obstaculo {
    var anchoDePared
    var constanteResistencia

    override method resistencia() = anchoDePared * constanteResistencia
}

const paredDeVidrio = new Pared(10, 10)
const paredDeMadera = new Pared(10, 25)
const paredDePiedra = new Pared(10, 50)

class CerditoObrero inherits Obstaculo {
    override method resistencia() = 50
}

class CerditoArmado inherits Obstaculo {
    var resistenciaDeDefensa

    override method resistencia() = 10 * resistenciaDeDefensa
}


*/

class Obstaculo {

    method resistencia() 
}

const paredDeVidrio = new ParedDeVidrio(anchoDePared = 10)

class Pared inherits Obstaculo  {

    var anchoDePared

    override method resistencia() = anchoDePared*self.constante()

    method constante()
}
class ParedDeVidrio inherits Pared {

    override method constante() = 10
}
class ParedDeMadera inherits Pared {

    override method constante() = 25
}
class ParedDePierda inherits Pared {

    override method constante() = 50
}

class CerditoObrero inherits Obstaculo {

    override method resistencia() = 50
}

class CerditoArmado inherits Obstaculo {

    var resistenciaDeDefensa // casco o escudo 

    override method resistencia() = 10*resistenciaDeDefensa
}


// TIPOS 

class Red inherits Pajaro{
    
    override method constanteDePajaro() = 10*cantidadDeEnojos
}

class Bomb inherits Pajaro {

    var property topeDeFuerza = 9000

    override method constanteDePajaro() = 
    if(ira*2 < topeDeFuerza) 
    2
    else 
    9000/ira 

}

class Chuck inherits Pajaro {

    var velocidadInstantanea 

    override method puedeTranquilizarse() = false 

    method velocidadMenorA80() = velocidadInstantanea <= 80 

    method fuerzaAmasDe80() = (velocidadInstantanea - 80)*5  

    override method enojarse() {
        enojado = true 
        velocidadInstantanea = velocidadInstantanea*2
    } 

    override method fuerza() =
    if(self.velocidadMenorA80()) 
    150 
    else 
    self.fuerzaAmasDe80()
}

class Terence inherits Pajaro{

    var property multiplicador 

    override method constanteDePajaro() = cantidadDeEnojos*multiplicador  
}

class Huevo {

    var property peso 
}

class Matilda inherits Pajaro {

    var huevos = []

    method ponerHuevosDe2kg() {
        const huevo = new Huevo (peso = 2)
        huevos.add(huevo)
    }

    method ponerHuevo(){
    const peso = (0.1).randomUpTo(2)
    const huevo = new Huevo (peso = peso)
    huevos.add(huevo)
    }

    method ponerHuevos(peso){
    if(enojado)
    self.ponerHuevosDe2kg()
    else self.ponerHuevo()
    }

    method fuerzaDeLosHuevos() = 
    huevos.map{huevo => huevo.peso()}.sum()


    override method fuerza() = ira*2 + self.fuerzaDeLosHuevos()
}


// OBSTACULOS



