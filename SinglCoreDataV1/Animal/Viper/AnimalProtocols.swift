//
//  AnimalProtocols.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import Foundation

protocol AnimalTableViewProtocol: AnyObject {
    func removeAnimal(animal: AnimalEntity)
    func editAnimal(animal: AnimalEntity)
}

protocol AnimalPresenterConfigurationProtocol: AnyObject {
    var view: AnimalViewProtocol! { get set }
    var interactor: AnimalInteractorInputProtocol! { get set }
    var router: AnimalRouterProtocol! { get set }
}

protocol AnimalPresenterProtocol: AnyObject {
    func viewDidLoad()
    func goToItemScreen()
    func removeAnimal(animal: AnimalEntity)
    func addAnimal(name: String, type: String)
    func editeAnimal(name: String, type: String, id: String)
}

protocol AnimalPresenterOutputProtocol: AnyObject {
    func getSavedAnimals(animals: [AnimalEntity])
}

protocol AnimalInteractorInputProtocol: AnyObject {
    var presenter: AnimalPresenterOutputProtocol! { get set }
    func getAnimals()
    func removeAnimal(animal: AnimalEntity)
    func editeAnimal(animal: AnimalEntity)
    func saveAnimal(animal: AnimalEntity)
}

protocol AnimalRouterProtocol: AnyObject {
    func goToItemScreen(from view: AnimalViewProtocol)
}

protocol AnimalViewProtocol: AnyObject {
    var presenter: AnimalPresenterProtocol! { get set }
    func updateArrayAnimals(animals: [AnimalEntity])
}


