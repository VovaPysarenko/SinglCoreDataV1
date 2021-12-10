//
//  CoreDataProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 09.12.2021.
//

import Foundation
import CoreData

class CoreDataProvider: CoreData {
    
    var context: NSManagedObjectContext!

    func saveAnimal(animal: AnimalEntity) -> AnimalEntity {
        let entity = NSEntityDescription.entity(forEntityName: "Animal", in: context)
        guard let entity = entity else {return}
        guard let animalObject = NSManagedObject(entity: entity, insertInto: context) as? Animal else {return}
        animalObject.id = animal.id
        animalObject.name = animal.name
        animalObject.type = animal.type
        animalObject.timestamp = animal.timestamp

        saveContext()
        return
    }
    
}

struct AnimalEntity {
    let id: String
    let name: String?
    let type: String?
    let timestamp: Int64
}
