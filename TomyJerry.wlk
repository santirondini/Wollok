
object tom {

    var energia = 50 

    method velocidadMax () = 5 + energia/10 

    method energia () = energia 
    
    method corre(metros) {
        energia = energia - metros/2
    }

    method energiaPostCorrida(distancia){
        self.corre(distancia)
        const energ = self.energia()
        return energ
    }

    method energiaPostComida(raton){
        self.come(raton)
        const energiaNew = self.energia()
        return energiaNew
    }

    method comparacionDeEnergias(antes,despues) = antes > despues


    method puedeComer(distancia) {
        const energiaAntes = self.energia()
        const energiaDespues = self.energiaPostCorrida(distancia)
        return self.comparacionDeEnergias(energiaAntes, energiaDespues)
    }
    

    method quiereComer(raton,distancia){
        const energiaAGastar = self.energiaPostCorrida(distancia)
        const energiaAGanar = self.energiaPostComida(raton)
        return self.comparacionDeEnergias(energiaAGanar,energiaAGastar)
    }

    method come(raton){
        energia = energia + 12 + raton.peso()
    }

}

object jerry {

    var edad = 2

    method peso () = 20*edad

    method crecer(){
        edad = edad + 1
    }
}

object nibbles {

    method peso () = 35

}



