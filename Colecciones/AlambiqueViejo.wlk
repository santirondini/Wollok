
object carrera {

    var inscriptos = []
    var rechazados = []

    var ciudad = "Buenos Aires"

    method puedeCorrer(vehiculo) = vehiculo.puedeCorrerEn.contains(ciudad)

    method inscribirse(vehiculo) {
        if (self.puedeCorrer(vehiculo)) {
            inscriptos.add(vehiculo)
        } else {
            rechazados.add(vehiculo)
        }
    }

    method replanificacion(nuevoLugar){
        ciudad = nuevoLugar
        inscriptos.forEach {vehiculo => vehiculo.inscribirse()}
        rechazados.forEach {vehiculo => vehiculo.inscribirse()}        
    }
     
}


class Vehiculo {

    const puedeCorrerEn = []

}