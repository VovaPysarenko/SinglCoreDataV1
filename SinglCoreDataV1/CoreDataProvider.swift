//
//  CoreDataProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 09.12.2021.
//

import Foundation
import CoreData

class CoreDataProvider: CoreData {
    
//    var context: NSManagedObjectContext!

    func saveAnimal(animal: AnimalEntity) -> [AnimalEntity] {
        let context = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Animal", in: context)
        guard let entity = entity else {return [] }
        guard let animalObject = NSManagedObject(entity: entity, insertInto: context) as? Animal else {return []}
        animalObject.id = animal.id
        animalObject.name = animal.name
        animalObject.type = animal.type
        animalObject.timestamp = animal.timestamp
        
        saveContext()
        print("fastPrint animalObject.name    \(animalObject.name)")

        return getAnimals()
    }
    
    func getAnimals() -> [AnimalEntity] {
        let context = persistentContainer.viewContext

        do {
            var animals = try context.fetch(Animal.fetchRequest())
            print("fastPrint animalsanimals   animals \(animals)")
//            animals.sort { $0.name! < $1.name! }
        } catch {
            print(error.localizedDescription)
        }
//        let d = animals
//        print("fastPrint animalanimalanimal  \(animal)")
//        print("fastPrint ddddd \(d)")
        return animals
        
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Animal")
//        request.returnsObjectsAsFaults = false
//        do {
//            let result = try context.fetch(request)
//            guard let savedDevices = result as? [Animal] else {return []}
//            return savedDevices
//        } catch {
//            print("Failed")
//            return []
//        }
    }
    
}

struct AnimalEntity {
    let id: String
    let name: String?
    let type: String?
    let timestamp: Int64
}
