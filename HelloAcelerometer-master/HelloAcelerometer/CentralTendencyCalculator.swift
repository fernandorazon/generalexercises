//
//  CentralTendencyCalculator.swift
//  HelloAcelerometer
//
//  Created by Luis Ezcurdia on 5/2/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

class CentralTendencyCalculator {
    
    var total: Double = 0.0
    var count: UInt = 0
    var minimo: Double = 0
    var maximo: Double = 0
    
    
    func append(_ item: Double) {
        if count == 0 {
            minimo = item
            maximo = item
        } else {
            if item < minimo {minimo = item}
            if item > maximo {maximo = item}
        }
        
    }

    func avg() -> Double {
        if count != 0{
            return total/Double(count)
        } else {
            return 0.0
        }
        
    }
    

    func min() -> Double {
        return self.minimo
    }

    func max() -> Double {
        return self.maximo
    }
}
