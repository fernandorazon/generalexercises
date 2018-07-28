//
//  ViewController.swift
//  weather2
//
//  Created by d182_fernando_r on 06/04/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let url = URL(string: "http://api.openweathermap.org/data/2.5/wheater?q=London,uk&units=metric&APPID=d63220552e788578073c7f8c3e8bd4fa")
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&APPID=ffa756dccfd4699dd19b042e99b027dd")

        
        let task = URLSession.shared.dataTask(
            with: url!,
            completionHandler:{(data, response, error) in //funcion que se va a ejecutar si la peticion es exitosa
                if(data != nil){
                    do { //try catch
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] //Diccionario con llave string y valor any
                        
                        DispatchQueue.main.sync {
                            if let main = json!["main"] as! [String: Any]? {
                                self.temperatureLabel.text = "\(main["temp"] as! Double)º C"
                            }
                            self.locationLabel.text = json!["name"] as? String
                        }
                        
                    }catch let e {
                        print("Error retrieving weather data: \(e)");
                    }
                }
        }
        )
        
        task.resume() //Aqui se ejecuta la tarea
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    



}

