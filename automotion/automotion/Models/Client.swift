//
//  Client.swift
//  automotion
//
//  Created by d182_fernando_r on 16/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation

enum Gender{
    case female
    case male 
}




struct Client {
    let firstName: String?
    let lastName: String?
    let email: String?
    let genero: Gender?
    
    var fullName: String {
        
        var out = ""
        if let fname = firstName {
            out += fname
        }
        
        if out.isEmpty {
            out = "No name"
        }
        
        return out
        
    }
    
    
    
}



