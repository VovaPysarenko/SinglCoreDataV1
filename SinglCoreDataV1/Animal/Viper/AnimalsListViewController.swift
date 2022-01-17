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
        animalTableView.animalProtocol = self
        presenter.viewDidLoad()
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
            self.presenter.addAnimal(name: name, type: type)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func openPressed(_ sender: Any) {
        presenter.goToItemScreen()
    }
}

// MARK: - Extensions
extension AnimalsListViewController: AnimalTableViewProtocol {
    
    func removeAnimal(animal: AnimalEntity) {
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
            guard let id = animal.id else {return}
            self?.presenter.editeAnimal(name: name, type: type, id: id)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AnimalsListViewController: AnimalViewProtocol {
    
    func updateArrayAnimals(animals: [AnimalEntity]) {
        self.animalTableView.animals = animals
        self.animalTableView.reloadData()
    }
}
