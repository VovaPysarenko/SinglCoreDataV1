//
//  AnimalsListViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 06.12.2021.
//

import UIKit
import CoreData

class AnimalsListViewController: UIViewController {
    
    @IBOutlet weak var animalTableView: UITableView!
    
    var context: NSManagedObjectContext!
    var animals = [AnimalEntity]()
    var coreDataProvider = CoreDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTableView.dataSource = self
        animalTableView.delegate = self
        let nibName  = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        animalTableView.register(nibName, forCellReuseIdentifier: "AnimalTableViewCell")
        self.animals = self.coreDataProvider.getAnimals()
    }
    
    @IBAction func addAnimalPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Animal", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Type"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textFields = alertController.textFields else {return}
            guard let name = textFields[0].text else {return}
            guard let type = textFields[1].text else {return}
            let animal = AnimalEntity(id: UUID().uuidString, name: name, type: type, timestamp: Date().currentTimeMillis())
            self.coreDataProvider.saveAnimal(animal: animal)
            self.animals = self.coreDataProvider.getAnimals()
            self.animalTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    func editAnimal(name: String, type: String) {
        let entity = NSEntityDescription.entity(forEntityName: "Animal", in: context)
        guard let entity = entity else {return}
        guard let animalObject = NSManagedObject(entity: entity, insertInto: context) as? Animal else {return}
        animalObject.name = name
        animalObject.type = type
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        self.animalTableView.reloadData()
    }
}

extension AnimalsListViewController: UITableViewDelegate, UITableViewDataSource {
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
        print("fastPrint ----animal----  \(animal)")
        if editingStyle == .delete {
            self.coreDataProvider.removeAnimal(animal: animal)
            animals.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row]
//        print("fastPrint   ----name------   \(animal.name)")
//        print("fastPrint   -----type-----   \(animal.type)")

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
            self.editAnimal(name: name, type: type)
            self.animalTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension Date {
  func currentTimeMillis() -> Int64 {
    return Int64(self.timeIntervalSince1970 * 1000)
  }
}
