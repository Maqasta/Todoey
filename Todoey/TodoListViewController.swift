//
//  ViewController.swift
//  Todoey
//
//  Created by Данил Фролов on 18.09.2021.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Write letter", "Watch lesson", "Complete todoe app"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

}

