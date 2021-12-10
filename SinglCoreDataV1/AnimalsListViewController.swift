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
    var animals: [Animal] = []
    var coreDataProvider = CoreDataProvider()
    let uuid = UUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalTableView.dataSource = self
        animalTableView.delegate = self
        let nibName  = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        animalTableView.register(nibName, forCellReuseIdentifier: "AnimalTableViewCell")
        getAnimals()

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
            let animal = AnimalEntity(id: self.uuid, name: name, type: type, timestamp: Date().currentTimeMillis())
            self.coreDataProvider.saveAnimal(animal: animal)
//            self.saveAnimal(name: name, type: type)
//            self.animals.sort { $0.name! < $1.name!}
            self.animalTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
//    func saveAnimal(name: String, type: String) {
//        let entity = NSEntityDescription.entity(forEntityName: "Animal", in: context)
//        guard let entity = entity else {return}
//        print("fastPrint entityentityentity   \(entity)")
//        guard let animalObject = NSManagedObject(entity: entity, insertInto: context) as? Animal else {return}
//        animalObject.name = name
//        animalObject.type = type
//
//        do {
//            try context.save()
//            animals.append(animalObject)
//        } catch {
//            print(error.localizedDescription)
//        }
//        print("fastPrint self.animals   self.animals \(self.animals)")
//    }
    
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
    
    
    func getAnimals() {
        do {
            self.animals = try context.fetch(Animal.fetchRequest())
            self.animals.sort { $0.name! < $1.name! }
            print("fastPrint==========     \(self.animals)")
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
        
        guard let animal = animals[indexPath.row] as? Animal else {return}
        if editingStyle == .delete {
            context.delete(animal)
            animals.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row]
        print("fastPrint   ----name------   \(animal.name)")
        print("fastPrint   -----type-----   \(animal.type)")

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
            self.animals.sort { $0.name! < $1.name! }
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
