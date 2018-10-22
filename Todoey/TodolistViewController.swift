//
//  ViewController.swift
//  Todoey
//
//  Created by sivakumar on 22/10/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController {
    
    var myArray = ["sivakumar", "fdsfsgg", "ssgrfgdfg"]
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  let items = defaults.array(forKey: "TodoListArray") as? [String]{
            myArray = items
        }
        
    }
    
    //MARK: TableView Datasource  Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemcell", for: indexPath)
            cell.textLabel?.text = myArray[indexPath.row]
        return cell
    }
    
    //MARK: TableView Delegate Methods


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(myArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    
}
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New item", message: "", preferredStyle: .alert)
        alert.addTextField { (alerttextfield) in
            alerttextfield.placeholder = "Enter New item"
            textfield = alerttextfield
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            self.myArray.append(textfield.text!)
            self.defaults.set(self.myArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    

}
