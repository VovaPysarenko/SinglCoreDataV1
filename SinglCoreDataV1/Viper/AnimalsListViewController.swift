//
//  AnimalsListViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 06.12.2021.
//

import UIKit

class AnimalsListViewController: UIViewController {
    
    @IBOutlet weak var animalTableView: AnimalsTableView!
    var presenter: AnimalPresenterProtocol!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName  = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        animalTableView.register(nibName, forCellReuseIdentifier: "AnimalTableViewCell")
        
        animalTableView.delegate = animalTableView
        animalTableView.dataSource = animalTableView

        presenter.viewDidLoad()
//        animalTableView.animalProtocol = self
//        animalTableView.animals = coreDataProvider.getAnimals()
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
//            self.animalTableView.animals = self.coreDataProvider.saveAnimal(animal: animal)
            self.presenter.addAnimal(animal: animal)
            self.animalTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AnimalsListViewController: AnimalTableViewProtocol {
    func removeAnimal(animal: AnimalEntity) {
//        self.coreDataProvider.removeAnimal(animal: animal)
        self.presenter.removeAnimal(animal: animal)

    }
    
    func editAnimal(animal: AnimalEntity) {
        let alertController = UIAlertController(title: "Animal", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = animal.name
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.text = animal.type
            textField.placeholder = "Type"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let textFields = alertController.textFields else {return}
            guard let name = textFields[0].text else {return}
            guard let type = textFields[1].text else {return}
            
            for item in self?.animalTableView.animals ?? [] {
                if item.id == animal.id {
                    let newAnimal = AnimalEntity(id: animal.id, name: name, type: type, timestamp: Date().currentTimeMillis())
//                    self?.animalTableView.animals = self?.coreDataProvider.editAnimal(animal: newAnimal) ?? []
                }
            }
            self?.animalTableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}




//extension Date {
//    func currentTimeMillis() -> Int64 {
//        return Int64(self.timeIntervalSince1970 * 1000)
//    }
//}
extension AnimalsListViewController: AnimalViewProtocol {
    

}
