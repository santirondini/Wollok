// Superherores:

object ernesto {
    
    var energia = 50

    method energia () = energia

    method comeAlfajor(){
        energia = energia*1.1
    }

    method puedeVolar() = false 
}

// Cambiamos que el helicoptero este como una variable dentro 

object uma {

    const energia = 500 

    var transporte = helicoptero

    method energia () = energia

    method puedeVolar() = transporte.puedeDespegar()

    method cambiarTransporte(nuevoTrasporte){
        transporte = nuevoTrasporte
    }
}

  
object helicoptero {

    var combustible = 0

    method puedeDespegar () {
        combustible >= 10
    }

    method cargarCombustible (){
        combustible = combustible + 5
    }
}

object colectivo {
    method puedeDespegar () = false 
}

// misiones: 

object salvarElAvion {
    method condiciones(superheroe) = superheroe.puedeVolar() // sintaxis para corroborar
}

object evitarChoque {

    method condiciones(superheroe){
        superheroe.energia() >= 100
    }
}

object aurora {
  
    var cirugias = 0 
    var energia = 200

    method cirugias () = cirugias

    method hacerCirugia (){
        cirugias = cirugias + 1
        energia = energia - 5
    }

    method puedeVolar (){
        cirugias > 2  
    }
}


// Para uma, todos los transportes son polimorficos, ya que todos tienen el metodo puedeDespegar

// Testing. Crear un archivo . wtest 













