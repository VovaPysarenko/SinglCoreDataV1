//
//  AnimalPresenter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//
import Foundation

class AnimalPresenter: AnimalPresenterConfigurationProtocol {
    
    weak var view: AnimalViewProtocol!
    var interactor: AnimalInteractorInputProtocol!
    var router: AnimalRouterProtocol!
}

// MARK: - Extensions
extension AnimalPresenter: AnimalPresenterProtocol {
    
    func viewDidLoad() {
        interactor.getAnimals()
    }
    
    func addAnimal(name: String, type: String) {
        let animal = AnimalEntity(id: UUID().uuidString, name: name, type: type, timestamp: Date().currentTimeMillis())
        let animalRealm = AnimalEntityMD(id: UUID().uuidString, name: name, type: type, timestamp: Int(Date().currentTimeMillis()))
        interactor.saveAnimal(animal: animal, animalRealm: animalRealm)
    }
    
    func editeAnimal(name: String, type: String, id: String) {
        let newAnimal = AnimalEntity(id: id, name: name, type: type, timestamp: Date().currentTimeMillis())
        interactor.editeAnimal(animal: newAnimal)
    }
    
    func removeAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD) {
        interactor.removeAnimal(animal: animal, animalRealm: animalRealm)
    }
    
    func getAnimal() {
        interactor.getAnimals()
    }
}

extension AnimalPresenter: AnimalPresenterOutputProtocol {
    func getSavedAnimals(animals: [AnimalEntity]) {
        self.view.updateArrayAnimals(animals: animals)
    }
    func getSavedAnimalsRealm(animals: [AnimalEntityMD]) {
        self.view.updateArrayAnimalsRealm(animals: animals)
    }
}

