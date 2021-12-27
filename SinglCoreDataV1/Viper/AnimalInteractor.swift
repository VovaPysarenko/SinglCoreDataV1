//
//  AnimalInteractor.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import Foundation

class AnimalInteractor: NSObject {
    weak var presenter: AnimalIneractorOutputProtocol!
    var coreDataProvider = CoreDataProvider()
    
    var animals = [AnimalEntity]()

}

// MARK: - Extensions
extension AnimalInteractor: AnimalIneractorInputProtocol {
    func getAnimals() {
        self.animals = coreDataProvider.getAnimals()
    }
    
    func removeAnimal(animal: AnimalEntity) {
        self.coreDataProvider.removeAnimal(animal: animal)
    }
    
    func editAnimal(animal: AnimalEntity) {
        
    }
    
    func addAnimal(animal: AnimalEntity) {
        
    }
    
    
   
}

