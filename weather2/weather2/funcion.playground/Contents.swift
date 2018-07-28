//: Playground - noun: a place where people can play

// Uso de funciones anonimas
import Cocoa

let numbers = [2,4,31,3,56]

func conmpareAscending(i:Int,j:Int) -> Bool {
    
    return i < j
    
}

let sorteNumber = numbers.sorted(by: conmpareAscending)

//let sorteNumber2 = numbers.sorted(by:{(i: Int, j: Int)->Bool})

//let mappedNumbers = numbers.map({
    
//    (i: Int, j: Int) -> Bool in
//    return i < j
    
//})



typealias myFunction = (String) -> ()

//Esta funcion regresa otra funcion cuya firma esta definida por el closure
//Con el alias myFunction

func repeatPrint(times: Int) -> myFunction {
    
    func printer(text: String) {
        
        for _ in 1...times {
              print(text)
        }
    }
    
    return printer
    
}

//Aqui se construyen funciones al vuelo
let log1 = repeatPrint(times: 5)
log1("Hola")

func addTwoNumbers(number1: Int, number2: Int) -> Int {
    
    return number1 + number2
    
}

var suma = addTwoNumbers
suma(5,6)



var storeClosure: (Int, Int) -> Int = { (number1, number2) in
    
    return number1 + number2
    
}

var storedClosure: (Int, Int) -> Int = {$0 + $1}

storedClosure(29,17)
















