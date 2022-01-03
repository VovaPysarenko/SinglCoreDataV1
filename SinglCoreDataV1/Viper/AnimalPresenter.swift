//
//  AnimalPresenter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//
import Foundation

class AnimalPresenter {
    
    weak var view: AnimalViewProtocol!
    var interactor: AnimalInteractorInputProtocol!
    var router: AnimalRouterProtocol!
}

// MARK: - Extensions
extension AnimalPresenter : AnimalPresenterProtocol {
    
    func viewDidLoad() {
        interactor.getAnimals()
    }
    
    func addAnimal(name: String, type: String) {
        let animal = AnimalEntity(id: UUID().uuidString, name: name, type: type, timestamp: Date().currentTimeMillis())
        interactor.saveAnimal(animal: animal)
    }
    
    func editeAnimal(name: String, type: String, id: String) {
        let newAnimal = AnimalEntity(id: id, name: name, type: type, timestamp: Date().currentTimeMillis())
        interactor.editeAnimal(animal: newAnimal)
    }
    
    func removeAnimal(animal: AnimalEntity) {
        interactor.removeAnimal(animal: animal)
    }
    
    func getAnimal() {
        interactor.getAnimals()
    }
}

extension AnimalPresenter: AnimalPresenterOutputProtocol {
    func getSavedAnimals(animals: [AnimalEntity]) {
        self.view.updateArrayAnimals(animals: animals)
    }
}

