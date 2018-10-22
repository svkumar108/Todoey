//
//  ViewController.swift
//  Todoey
//
//  Created by sivakumar on 22/10/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController {
    
    let myArray = ["sivakumar", "fdsfsgg", "ssgrfgdfg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

}
