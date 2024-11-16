
class Operacion {

    var  property  valor 

    var inmueble

    method valorInmueble() = inmueble.valor()

    method comision() = 0
}

class Alquiler inherits Operacion{

    const mesesDeContrato 

    override method comision() = (mesesDeContrato * super().valorInmueble()) / 50000   
}

class Venta inherits Operacion {
    
    var porcentajeDeInmueble

    method porcentajeDeInmueble() = porcentajeDeInmueble

    method cambiarPorcentaje(nuevo) {
        porcentajeDeInmueble = nuevo
    }

    override method comision() = super().valorInmueble()*porcentajeDeInmueble 
}

class Cliente{

    const nombre 

    method solicitarReserva(empleado,inmueble) {
        const reserva = new Reserva(aNombre = nombre, inmueble = inmueble)
        empleado.reservas().add(reserva)
        // inmueble.estaReservada = true 
    }

    method concretarOperacion(empleado,propiedad) {
        // buscar en 
    }
}

class Reserva {

    const aNombre 

    var inmueble 
}

class Empleado {

    var operaciones = []

    var reservas = []

    method reservas() = reservas

    method operaciones() = operaciones

    var dinero = 0

    method concretarOperacion(operacion) {
        operaciones.add(operacion)
        dinero =+ operacion.comision()
    }

}

class Inmobiliaria {

    var empleados = []

    var propiedades = []

    method mejorEmpleadoSegun 

    method tendranProblemas(empleado1,empleado2)

}

// Preguntar bien el tema de criterios

class Inmueble{

    const tamanio

    var property cantidadAmbientes

    var operacion 

    var plusXzona

    var estaReservada

    method valor()

    method cambiarOperacion(nuevaOperacion) {
        operacion = nuevaOperacion
    }
}

class Casa inherits Inmueble{

    var valorCasa

    override method valor() = valorCasa + plusXzona 
}

class PH inherits Inmueble{

    var valorPorM2

    override method valor() = tamanio*valorPorM2 + plusXzona 
}

class Departamento inherits Inmueble{

    override method valor() = 350000*cantidadAmbientes + plusXzona 
}



