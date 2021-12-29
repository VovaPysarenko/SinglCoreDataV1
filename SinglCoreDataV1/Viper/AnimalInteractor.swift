//
//  AnimalInteractor.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import Foundation

class AnimalInteractor: NSObject {
    weak var presenter: AnimalInteractorOutputProtocol!
    var coreDataProvider = CoreDataProvider()
    
    var animals = [AnimalEntity]()

}

// MARK: - Extensions
extension AnimalInteractor: AnimalInteractorInputProtocol {

    func getAnimals() {
        self.animals = coreDataProvider.getAnimals()
    }
    
    func removeAnimal(animal: AnimalEntity) {
        self.coreDataProvider.removeAnimal(animal: animal)
        print("----FASTPRINT--removeAnimal--   \(self.animals)")
    }
    
    func editAnimal(animal: AnimalEntity) {
        
    }
    
    func saveAnimal(animal: AnimalEntity) {
//        let animal = AnimalEntity(id: UUID().uuidString, name: name, type: type, timestamp: Date().currentTimeMillis())
        self.animals = self.coreDataProvider.saveAnimal(animal: animal)
    }
    
}



extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
