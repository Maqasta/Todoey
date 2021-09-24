//
//  ViewController.swift
//  Todoey
//
//  Created by Данил Фролов on 18.09.2021.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
//        if let item = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = item
//
//        }
        
        var newItem = Item()
        newItem.title = "First"
        itemArray.append(newItem)
        
        var newItem2 = Item()
        newItem2.title = "Second"
        itemArray.append(newItem2)
        
        var newItem3 = Item()
        newItem3.title = "Third"
        itemArray.append(newItem3)
    }

    // MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if itemArray[indexPath.row].done == true {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Add new item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { UIAlertAction in
            guard textfield.text! != "" else { return }
            self.itemArray.append(Item(title: textfield.text!))
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { allertTextField in
            allertTextField.placeholder = "Create new item"
            textfield = allertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

