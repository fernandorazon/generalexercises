//
//  KeyValueStore.swift
//  LocalSettings
//
//  Created by Luis Ezcurdia on 4/14/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

class KeyValueStore: NSSecureCoding {
    static var supportsSecureCoding: Bool = true

    func encode(with aCoder: NSCoder) {
        
        

    }

    required init?(coder aDecoder: NSCoder) {
    }

    var dict: [String: String] = [String: String]()

}
