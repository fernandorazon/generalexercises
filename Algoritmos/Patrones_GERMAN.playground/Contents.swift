//: Playground - noun: a place where people can play

import UIKit

//Protocolo del que se conforma el decorador y la clase
protocol Taco {
    
    var costo: Double { get }
    var descripcion: String { get }
    
}

//Clase a ser extendida por otras
class TacoDeCarnitas: Taco {
    var costo: Double {
        get {
            return 15.0
        }
    }
    
    var descripcion: String {
        get {
            return "Taco de carnitas"
        }
    }
}

//El decorador debe ser una clase
//Ya que no es un buen diseño que un protocolo herede de un protocolo

class TacoDecorador: Taco {
    
    let tacoInstance: Taco
    
    init(taquito: Taco){
        tacoInstance = taquito
    }
    
    var costo: Double {
        get {
            return tacoInstance.costo
        }
    }
    
    var descripcion: String {
        get {
            return tacoInstance.descripcion
        }
    }
    
}

class Cilantro: TacoDecorador {
    
    override var costo: Double {
        get{
            return tacoInstance.costo
        }
    }
    
    override var descripcion: String {
        get{
            return tacoInstance.descripcion + " cilantro"
        }
    }
    
}

class Aguacate: TacoDecorador {
    
    override var costo: Double {
        get{
            return tacoInstance.costo
        }
    }
    
    override var descripcion: String {
        get{
            return tacoInstance.descripcion + " aguacate"
        }
    }
    
}

func main(){
    let nuevoTaco = TacoDeCarnitas()
    
    let taquito: Taco = TacoDecorador(taquito: nuevoTaco)
    
    print("Comere " + taquito.descripcion)
    
    Cilantro(taquito: nuevoTaco)
    
    print("Comere " + taquito.descripcion)
    
}






