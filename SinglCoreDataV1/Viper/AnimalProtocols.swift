//
//  AnimalProtocols.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import Foundation

protocol AnimalTableViewProtocol: AnyObject {
    func removeAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD)
    func editAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD)
}

protocol AnimalPresenterProtocol: AnyObject {

    func viewDidLoad()
    func removeAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD)
    func addAnimal(name: String, type: String)
    func editeAnimal(name: String, type: String, id: String)
}

protocol AnimalPresenterConfigurationProtocol: AnyObject {
    var view: AnimalViewProtocol! { get set }
    var interactor: AnimalInteractorInputProtocol! { get set }
    var router: AnimalRouterProtocol! { get set }
}

protocol AnimalPresenterOutputProtocol: AnyObject {
    func getSavedAnimals(animals: [AnimalEntity])
    func getSavedAnimalsRealm(animals: [AnimalEntityMD])
}

protocol AnimalInteractorInputProtocol: AnyObject {
    var presenter: AnimalPresenterOutputProtocol! { get set }
    func getAnimals()
    func removeAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD)
    func editeAnimal(animal: AnimalEntity)
    func saveAnimal(animal: AnimalEntity, animalRealm: AnimalEntityMD)
}

protocol AnimalRouterProtocol: AnyObject {}

protocol AnimalViewProtocol: AnyObject {
    var presenter: AnimalPresenterProtocol! { get set }
    func updateArrayAnimals(animals: [AnimalEntity])
    func updateArrayAnimalsRealm(animals: [AnimalEntityMD])
}


