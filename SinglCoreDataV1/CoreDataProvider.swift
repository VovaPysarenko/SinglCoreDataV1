//
//  CoreDataProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 09.12.2021.
//

import Foundation
import CoreData

class CoreDataProvider: CoreData {
    
    func saveAnimal(animal: AnimalEntity) -> [AnimalEntity] {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Animal", in: context)
        guard let entity = entity else {return [] }
        guard let animalObject = NSManagedObject(entity: entity, insertInto: context) as? Animal else {return []}
        guard let timestamp = animal.timestamp else {return []}
        animalObject.id = animal.id
        animalObject.name = animal.name
        animalObject.type = animal.type
        animalObject.timestamp = timestamp
        
        saveContext()
        return getAnimals()
    }
    
    func getAnimals() -> [AnimalEntity] {
        let context = persistentContainer.viewContext
        do {
            let animals = try context.fetch(Animal.fetchRequest())
            let animalItem = animals.compactMap { AnimalEntity(id: $0.id, name: $0.name, type: $0.type, timestamp: $0.timestamp) }
            let sortedAnimal = animalItem.sorted(by: {$0.timestamp! > $1.timestamp!})
            
            return sortedAnimal
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func removeAnimal(animal: AnimalEntity) {
        let context = persistentContainer.viewContext
        
        do {
            let animals = try context.fetch(Animal.fetchRequest())
            
            for item in animals {
                if item.id == animal.id {
                    context.delete(item)
                }
                saveContext()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editAnimal(animal: AnimalEntity) -> [AnimalEntity] {
        let context = persistentContainer.viewContext
        
        do {
            let animals = try context.fetch(Animal.fetchRequest())
            for item in animals {
                if item.id == animal.id {
                    item.id = animal.id
                    item.name = animal.name
                    item.type = animal.type
                    item.timestamp = animal.timestamp!
                }
                saveContext()
            }
        } catch {
            print(error.localizedDescription)
        }
        return getAnimals()
    }
}

struct AnimalEntity {
    let id: String?
    let name: String?
    let type: String?
    let timestamp: Int64?
}
