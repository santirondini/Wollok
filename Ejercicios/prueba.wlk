
object golondrina {
    var energia = 100

    method energia () = energia

    method entrenar(minutos){
        energia = energia - minutos*3
    }

    method comer(gramos){
        energia = energia + gramos*2
    }
}

object entrenador{

    method entrenar(golondrina, minutos){
        golondrina.entrenar(minutos)
    }

    method alimentar(golondrina, gramos){
        golondrina.comer(gramos)
    }
}

