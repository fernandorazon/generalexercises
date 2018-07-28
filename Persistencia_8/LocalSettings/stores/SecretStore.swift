//
//  SecretStore.swift
//  LocalSettings
//
//  Created by d182_fernando_r on 14/04/18.
//  Copyright © 2018 Luis Ezcurdia. All rights reserved.
//

import Foundation

class SecretStore {
    static let shared = SecretStore()

    var baseUrl: URL = {
        var doc =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        doc.appendPathComponent("asdfals.mx")
        
    }()

    lazy var fileURL: URL? = {

        baseUrl.appendPathComponent("secrets.archive")

    }
    
    private var dict: [String:String] = [String:String]()
    
    init() {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: (fileURL?.path)!) as? [String:String] {
            dict = data
        }
    }
    
    func set(_ value: String, forKey key: String) -> String {
        dict[key] = value
        return dict[key]!
    }
    
    func get(forKey key: String) -> String {
        return dict[key]!
    }
    
    func save() -> Bool{
        NSKeyedArchiver.archiveRootObject(self.dict, toFile: fileURL?.path)
    }
    
    func saveBg(completion: ((Bool) -> Void)?) {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let that = self else {
                print("ERROR")
                return
            }
            let result = that.save()
            completion?(result)
        }
        
        
    }
    
}

//class DicWrapper {
//    var dict:[String:String] =
//
//}
//
//class SecureStringDict: NSSecureCoding {
//
//    static var supportsSecureCoding: Bool = true
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(dict, forKey: "dict")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        let decoded = aDecoder.decodeObject(of: SecureStringDict, forKey: "dict")
//    }
//
//    var dict: [String:String] = [String:String]()
//
//}
//

