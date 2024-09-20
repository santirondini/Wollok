
object feroz {

    var peso = 10

    var comidas = []

    method peso() = peso

    method modificarPeso(cantidad) {
        peso = cantidad 
    }

    method come(comida) = comidas.add(comida)

    // method pesoEntre(x, y) = obtenerPeso() >= x and obtenerPeso() <= y ==> NO CORRIÓ

    method estaSaludable() = (self.peso() > 20 and self.peso() < 150) and comidas.size() > 3

    method crisis() {
        peso = 10
        comidas = []
    }
}

class Personaje {

    var peso = 50

    method peso() = peso

    method modificarPeso(cantidad) {
        peso = cantidad 
    }
  
}

const caperusita = new Personaje()
const abuela = new Personaje()
const chancho = new Personaje()


object bruja {

    var casa = []

    method atrapa(personaje){
        casa.add(personaje)
    }  

    method estaContenta() =
        casa.filter {personaje => personaje.peso()}
        .sum() > 500

}