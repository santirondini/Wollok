
class Guerrero {

    var property potencialOfensivo

    var property experiencia

    var energia

    const primeraEnergia = energia

    var traje 

    method porcentajeDelPotencial() = potencialOfensivo*0.1

    method comeSemilla() {
        energia = primeraEnergia
    }

    method atacar(otroGuerrero) {
        experiencia += traje.expercienciaGanada(1)
        otroGuerrero.recibirDanio(self) 
        traje.desgastarse()
    }

    method recibirDanio(atacante) {
        const danioBase = atacante.porcentajeDelPotencial()
        energia -= traje.reducirDanio(danioBase)
        traje.desgastarse()
    }
}

class Sayayin inherits Guerrero{

    var nivelSSJ
    
    method convertirse(nivel){
        nivelSSJ = nivel
        potencialOfensivo = potencialOfensivo*1.5
    }

    override method recibirDanio(atacante){
        const danioBase = atacante.porcentajeDelPotencial()
        energia -= (traje.reducirDanio(danioBase))*(1 - nivelSSJ.resistencia())
        traje.desgastarse()
    }

    method volverAestadoOriginal() {
        nivelSSJ = base 
    }

    override method comeSemilla() {
        potencialOfensivo = potencialOfensivo*(1.05)
    }
}
class NivelSSJ {
    var property resistencia  
}
const base = new NivelSSJ(resistencia = 0)
const sjj = new NivelSSJ(resistencia = 0.05)
const sjj2 = new NivelSSJ(resistencia = 0.07)
const sjj3 = new NivelSSJ(resistencia = 0.15)

class Traje {

    var porcentaje

    var property desgaste = 0

    method piezas() = 1

    method estaDesgastado() = desgaste >= 100

    method desgastarse() {
        desgaste=+1
    }
    method reducirDanio(danio){
        return danio
    }

    method experienciaGanada(experecienciaBase) {
        return experecienciaBase
    }
}

class TrajeDeEntrenamiento inherits Traje {

    method cambiarPorcentaje(nuevo) {
        porcentaje = nuevo 
    }

    override method experienciaGanada(experienciaBase) {
        //if(self.estaDesgastado())
        //return experienciaBase
        return experienciaBase*porcentaje
    } 
}

class TrajeComun inherits Traje {

   override method reducirDanio(danio) {
        if (self.estaDesgastado()) 
            return danio // Traje desgastado: no reduce daño
        return danio * (1 - porcentaje) // Aplica reducción    
    }
}

class Pieza{
    var porcentajeDeRecistencia 
    var valorDeDesgaste

    method estaGastada() = valorDeDesgaste >= 20
}

class TrajeModularizado inherits Traje {

    var conjuntoDePiezas = []

    method estaGastado() =
    conjuntoDePiezas.all{pieza => pieza.estaGastada()}

    override method piezas() = conjuntoDePiezas.size()

    // simplificar metodos de filtro
    
    method filtrarPiezasBuenas() {
        const buenas = conjuntoDePiezas.filter{pieza => pieza.estaDesgastado().negate()}
        return buenas
    }

    method filtrarDesgastadas(){
        const malas = conjuntoDePiezas.filter{pieza => pieza.estaDesgastado()}
        return malas
    }
    
    override method reducirDanio(danio) {
        return danio - self.filtrarPiezasBuenas().sum()
    }

    method calculoDeExperiencia() {
        const cantidadDePiezasBuenas = self.filtrarPiezasBuenas().size()
        const cantidadDePiezasMalas = self.filtrarDesgastadas().size()
        return (cantidadDePiezasBuenas - cantidadDePiezasMalas) / cantidadDePiezasBuenas
    }

    override method experienciaGanada(base) {
        return base*(self.calculoDeExperiencia())
    }
}



class Torneo {

    var participantes = []

    var guerrerosTotales = []    

    method comenzarTorneo(criterio) {
        participantes.addAll(criterio.filtrar(guerrerosTotales))
    }
}

object powerlsBest{

    method filtrar(guerrerosTotales) {
    const mayorPoderDeAtaque = guerrerosTotales.sortBy {guerrero => guerrero.potencialOfensivo()}
    mayorPoderDeAtaque.reverse()
    return mayorPoderDeAtaque.take(16)
    }
}

object funny {
    
    method filtrar(guerrerosTotales) {
    const conMasElementos = guerrerosTotales.sortBy{guerrero => guerrero.traje().piezas()}
    conMasElementos.reverse()
    return conMasElementos
    }

}

object suprise {
    
    method filtrar(guerrerosTotales) {
    const alAzar = guerrerosTotales.
    shuffle().take(16)
    }
} 
 





