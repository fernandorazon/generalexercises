//
//  MyAppp.swift
//  Wheather
//
//  Created by d182_fernando_r on 03/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation

import UIKit

class MyApplication: UIApplication {
    
    override func sendEvent(_ event: UIEvent) {
        print("Hola")
        super.sendEvent(event)
    }
}
