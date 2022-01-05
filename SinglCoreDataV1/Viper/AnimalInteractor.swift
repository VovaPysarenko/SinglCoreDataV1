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
    var realmProvider = RealmProvider()
    var animals = [AnimalEntity]()
    var animalsRealm = [AnimalEntityMD]()
}

// MARK: - Extensions
extension AnimalInteractor: AnimalInteractorInputProtocol {

    func getAnimals() {
        self.animals = coreDataProvider.getAnimals()
        self.presenter.getSavedAnimals(animals: self.animals)
        self.animalsRealm = realmProvider.getObject()
        self.presenter.getSavedAnimalsRealm(animals: self.animalsRealm)
//        print("----FASTPRINT---- \(self.animals)")
//        print("----FASTPRINT--self.animalsRealmself.animalsRealm -- \(self.animalsRealm)")
    }
    
    func saveAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD) {
        self.animals = self.coreDataProvider.saveAnimal(animal: animal)
        self.presenter.getSavedAnimals(animals: animals)
        self.animalsRealm = self.realmProvider.saveObject(animalRealm)
        self.presenter.getSavedAnimalsRealm(animals: animalsRealm)
        print("----FASTPRINT--self.animals-- \(self.animals.count)")
        print("----FASTPRINT--self.animalsRealmself.animalsRealm -- \(self.animalsRealm.count)")
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
    
    func removeAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD) {
        self.coreDataProvider.removeAnimal(animal: animal)
        self.realmProvider.removeObject(animalRealm)
    }
}

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
