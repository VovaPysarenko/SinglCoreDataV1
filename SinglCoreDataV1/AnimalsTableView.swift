//
//  AnimalsTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 15.12.2021.
//

import UIKit

class AnimalsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var animals = [AnimalEntity]()
    weak var animalProtocol: AnimalProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            let animal = animals[indexPath.row]
            cell.nameLabel.text = animal.name
            cell.typeLabel.text = animal.type
//            cell.dateLabel.text = animal.timestamp.self
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row] 
        if editingStyle == .delete {
            self.animalProtocol?.removeAnimal(animal: animal)
            animals.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animal = animals[indexPath.row]
        self.animalProtocol?.editAnimal(animal: animal)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


