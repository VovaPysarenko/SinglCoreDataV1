//
//  AnimalsTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 15.12.2021.
//

import UIKit

class AnimalsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var animals = [AnimalEntity]()
    var coreDataProvider = CoreDataProvider()
    weak var viewController: UIViewController!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            let animal = animals[indexPath.row]
            cell.nameLabel.text = animal.name
            cell.typeLabel.text = animal.type
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let animal = animals[indexPath.row] as? AnimalEntity else {return}
        if editingStyle == .delete {
            self.coreDataProvider.removeAnimal(animal: animal)
            animals.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row]
        
        let alertController = UIAlertController(title: "Animal", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = animal.name
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.text = animal.type
            textField.placeholder = "Type"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textFields = alertController.textFields else {return}
            guard let name = textFields[0].text else {return}
            guard let type = textFields[1].text else {return}
            
            for item in self.animals {
                if item.id == animal.id {
                    let newAnimal = AnimalEntity(id: animal.id, name: name, type: type, timestamp: Date().currentTimeMillis())
                    self.animals = self.coreDataProvider.editAnimal(animal: newAnimal)
                }
            }
            self.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        viewController?.present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
