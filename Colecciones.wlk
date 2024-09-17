
class Vaca {

    var energia = 100

    method energia() = energia

    method ordenias(minutos){
        energia = self.energia() - minutos*3
    }

    method comer(gramos){
        energia = self.energia() + gramos*2
    }
    
    method estaContenta(){
        self.energia() > 50
    }
}

 // las listas arrancan con minisuculas :

const vacas = [new Vaca(), new Vaca(), new Vaca(), new Vaca(), new Vaca()]

/* Bloques: objeto con una interfaz con el mensaje apply

object criterio {
    method apply(clase u objecto a filtrar) = clase/objetco.metodoDentroDelObjetod()
}

*/
object energiaMayorA50 {
    method apply(vaca) = vaca.energia() > 50
  
}

// filtrar las vacas que tienen menos de 50 de energia:

// vacas.filter({vaca => vaca.estáContenta()}) o vacas.filter {vaca => vaca.estáContenta() }