
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



/*

Crear un objeto en base a la clase: 

const nombre = new Clase ()

const nombre = new Clase (parametro1 = x , parametro2 = y, ...)

Las referencias a los objetos creados con clases son variables que se pueden utilizar para acceder a los métodos y propiedades del objeto. 
Son los nombres de las variables que se utilizan para referirse a los objetos creados a partir de una clase.

Cuando creamos un objetivo a partir de una clase y no le ponemos referencia, no podemos acceder a sus métodos y propiedades. Ademas
ocupa momoria sin ser utilizada. Cuando un objeto pierde sus referencias, se lo lleva el Garbage Collector.

Gargabe Collector: Es un proceso que se encarga de liberar la memoria que ocupan los objetos que ya no se utilizan. 
No hay forma de recuperarlos. 

Ejemplos: 
*/

const marcelo = new Golondrina()


