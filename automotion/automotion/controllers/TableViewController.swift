//
//  TableViewController.swift
//  automotion
//
//  Created by d182_fernando_r on 16/03/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    typealias ClientResponse = ([Client]) -> Void
    
    var clients = [Client](){
        didSet{
            updateData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadClients()
        loadClientsService {clients in
            self.clients = clients
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.clients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientCell", for: indexPath)
        
        let client = clients[indexPath.row]
        
        cell.textLabel?.text = client.fullName
        cell.detailTextLabel?.text = client.email
        
        if client.genero == .female {
            cell.imageView?.image = UIImage(named: "heart")
        } else {
            cell.imageView?.image = UIImage(named: "user_male")
        }
        
        
        return cell
    }
    
    func loadClientsService(completion: ClientResponse){
        sleep(2)
        completion(loadClients())
    }
    
    func  loadClients() ->[Client] {
        return [
            Client(firstName: "ANA", lastName: "PEREZ", email: "ana@lacomer.com.io", genero: .female),
            Client(firstName: "JUAN", lastName: "PEREZ", email: "juan@lacomer.com.io", genero: .male),
            Client(firstName: "ANA", lastName: nil, email: "julio@lacomer.com.io", genero: .female),
            Client(firstName: "PEDRO", lastName: "PEREZ", email: nil, genero: .male),
            Client(firstName: nil, lastName: "PEREZ", email: "julio@lacomer.com.io", genero: .female)
        ]
    }
    
    func updateData() {
        self.tableView.reloadData()
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
