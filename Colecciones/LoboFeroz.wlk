
object feroz {

    var property peso = 10

    var comidas = []

    method peso() = peso

    method modificarPeso(cantidad) {
        peso += cantidad 
    }

    method come(personaje) {
        comidas.add(personaje)
        self.modificarPeso(personaje.peso())
    }
    method pesoEntre(x, y) = self.peso() >= x and self.peso() <= y
    
    method estaSaludable() = self.pesoEntre(20,150) and comidas.size() > 3

    method crisis() {
        peso = 10
        comidas = []
    }
}

class Personaje {

    var peso = 50

    method peso() = peso

    method modificarPeso(cantidad) {
        peso += cantidad 
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

    method pesoPromedio() {
        var sumatoria = casa.filter {personaje => personaje.peso()}
        .sum()
        return sumatoria / casa.size()
    }

    method menorAlpromedio(personaje) 
    = personaje.peso() < self.pesoPromedio()

    method personajesFlacos(){
        casa.filter{personaje => personaje.menorAlpromedio(self)}
    }

    method engordar(cantidad){
        casa.personajesFlacos().forEach { personaje => personaje.modificarPeso(cantidad)  }
    }

}