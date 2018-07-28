//
//  MainTabViewController.swift
//  automotion
//
//  Created by d182_fernando_r on 16/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrappeditems = self.tabBar.items else {return}
        
        for item in unwrappeditems {
            guard let unwrappeditemsTitle = item.title else {continue}
            if unwrappeditemsTitle == "Workshop" {
                item.badgeValue = "666"
            }
            
            if unwrappeditemsTitle == "Sales" {
                item.badgeValue = "10"
            }
            
            if unwrappeditemsTitle == "Clients" {
                item.badgeValue = "20"
            }
            
            print(item.title!)
        }
        debugPrint(self.tabBar.items!)

        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
