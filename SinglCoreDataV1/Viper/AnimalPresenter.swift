//
//  AnimalPresenter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

class AnimalPresenter {
    
    weak var view: AnimalViewProtocol!
    var interactor: AnimalInteractorInputProtocol!
    var router: AnimalRouterProtocol!
    
    func viewDidLoad() {
        interactor.getAnimals()
    }
}

extension AnimalPresenter : AnimalPresenterProtocol {
    func addAnimal(animal: AnimalEntity) {
        interactor.addAnimal(animal: animal)
    }
    
    func removeAnimal(animal: AnimalEntity) {
        interactor.removeAnimal(animal: animal)
        
    }

}

extension AnimalPresenter: AnimalInteractorOutputProtocol {

    
    
}

