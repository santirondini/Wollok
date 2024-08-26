

object maniac {

    var estrellas = 0 

    method estrellas () = estrellas 

    method encontrarEstrellas (){
        estrellas = estrellas + 8  
    }

    method regalarEstrellas (){
        estrellas = estrellas - 1
    }

    method tieneTodoListo() = estrellas >= 4    
}

object fiesta {

    var globos = 0
    var anfitrion = null 

    method globos () = globos

    method anfitrion() = anfitrion

    method inflarGlobos (){
        globos = globos + 10
    }

    method anfitrion(persona) {
        anfitrion = persona
    }

    method estaPreparada() {
        anfitrion.tieneTodoListo()
        globos >= 50
    }


}

object chuy {

    method tieneTodoListo() = true

}

object capy {

    var latas = 0

    method recoletar (){
        latas = latas + 1
    }

    method reciclar (){
        latas >= 5
        latas = latas - 5
    }

    method tieneTodoListo (){
        latas < 3
    }
  
}

object yvoty {

    var bateria = 0

    method bateria () = bateria

    method cargarBateria (){
        bateria = 100
    }
    
    method tieneTodoListo (){
        bateria >= 50
    }

}