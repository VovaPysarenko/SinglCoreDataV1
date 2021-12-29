//
//  AnimalProtocols.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

protocol AnimalTableViewProtocol: AnyObject {
    func removeAnimal(animal: AnimalEntity)
    func editAnimal(animal: AnimalEntity)
}

protocol AnimalPresenterProtocol: AnyObject {
    var view: AnimalViewProtocol! { get set }
    var interactor: AnimalInteractorInputProtocol! { get set }
    var router: AnimalRouterProtocol! { get set }
    func viewDidLoad()
    func removeAnimal(animal: AnimalEntity)
    func saveAnimal(animal: AnimalEntity)
    func getAnimal()
}

protocol AnimalInteractorOutputProtocol: AnyObject {

}

protocol AnimalInteractorInputProtocol: AnyObject {
    var presenter: AnimalInteractorOutputProtocol! { get set }
    var animals: [AnimalEntity] { get set }
    func getAnimals()
    func removeAnimal(animal: AnimalEntity)
    func editAnimal(animal: AnimalEntity)
    func saveAnimal(animal: AnimalEntity)
}

protocol AnimalRouterProtocol: AnyObject {

}

protocol AnimalViewProtocol: AnyObject {
    var presenter: AnimalPresenterProtocol! { get set }
    func updateArrayAnimals(animals: [AnimalEntity]?)
}


