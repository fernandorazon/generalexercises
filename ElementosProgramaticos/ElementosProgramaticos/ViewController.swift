//
//  ViewController.swift
//  ElementosProgramaticos
//
//  Created by d182_fernando_r on 09/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var segueSwitch: UISwitch!
    
    @IBAction func sandButton(_ sender: Any) {
        
        if segueSwitch.isOn{
            performSegue(withIdentifier: "sandView", sender: nil)
        }
        
    }
    
    
    @IBAction func pinkButton(_ sender: Any) {
        
        if segueSwitch.isOn{
            performSegue(withIdentifier: "pinkView", sender: nil)
        }
        
    }
    
    
}

