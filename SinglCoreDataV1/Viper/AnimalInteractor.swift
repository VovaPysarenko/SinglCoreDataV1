//
//  AnimalInteractor.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import Foundation

class AnimalInteractor: NSObject {
    weak var presenter: AnimalPresenterOutputProtocol!
    var coreDataProvider = CoreDataProvider()
    var animals = [AnimalEntity]()
}

// MARK: - Extensions
extension AnimalInteractor: AnimalInteractorInputProtocol {

    func getAnimals() {
        self.animals = coreDataProvider.getAnimals()
        self.presenter.getSavedAnimals(animals: self.animals)
    }
    
    func saveAnimal(animal: AnimalEntity) {
        self.animals = self.coreDataProvider.saveAnimal(animal: animal)
        self.presenter.getSavedAnimals(animals: animals)
    }
    
    func editeAnimal(animal: AnimalEntity) {
        for item in self.animals {
            if item.id == animal.id {
                let newAnimal = AnimalEntity(id: item.id, name: animal.name, type: animal.type, timestamp: Date().currentTimeMillis())
                self.animals = self.coreDataProvider.editAnimal(animal: newAnimal)
                self.presenter.getSavedAnimals(animals: self.animals)
            }
        }
    }
    
    func removeAnimal(animal: AnimalEntity) {
        self.coreDataProvider.removeAnimal(animal: animal)
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
