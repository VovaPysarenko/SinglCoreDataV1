//
//  AnimalsTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 15.12.2021.
//

import UIKit
import CloudKit

class AnimalsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var animals = [AnimalEntity]()
    weak var animalProtocol: AnimalProtocol?
    
    func timestampToDate(timestamp: Int64) -> String {
        
        let toDoubleTime = Double(timestamp) / 1000
        let date = Date(timeIntervalSince1970: toDoubleTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy HH:mm:ss"
        
        return formatter.string(from: date)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AnimalTableViewCell {
            let animal = animals[indexPath.row]
            let time = timestampToDate(timestamp: animal.timestamp!)

            print("----FASTPRINT---- \(time)")
            cell.nameLabel.text = animal.name
            cell.typeLabel.text = animal.type
            cell.dateLabel.text = time
            
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


