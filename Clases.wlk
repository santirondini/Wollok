
class Golondrina {
    var energia = 100

    method energia () = energia 

    method entrenar(minutos){
        energia = self.energia() - minutos*3
    }

    method comer(gramos){
        energia = self.energia() + gramos*2
    }
}

