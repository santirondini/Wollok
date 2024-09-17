
object gandalf {

    const vida = 100

    var poderDeArmas = 0
     
    const armas = [baculo, espada]

    method poderDeArmas(){
        poderDeArmas = armas.sum {arma => arma.poder()}
        return poderDeArmas        
    }

    method vida() = vida 

    method vidaMenorA(valor)= 
        vida < valor

    method poderConPocaVida(){
        const poder = self.vida()*300 + self.poderDeArmas()*2
        return poder 
    }

    method poderConMuchVida(){
        const poder = self.vida()*15 + self.poderDeArmas()*2
        return poder
    }

    method poder(){
        const poder = if (self.vidaMenorA(10)) self.poderConPocaVida() else
            self.poderConMuchVida()
            return poder 
    }   
 

}

object baculo {

    const poder = 400  
}

object espada {

    var origen = "élfico"
    
    const poder = 0

    method origen () = origen

    method cambiarOrigen (nuevoOrigen){
        origen = nuevoOrigen
    }

    method poder() {
        if (origen == "élfico") {
            return poder == 25
        } else if (origen == "enano") {
            return poder == 20
        } else if (origen == "humano") {
            return poder == 15
        } else {
            return poder ==  0
        }
    }
}




