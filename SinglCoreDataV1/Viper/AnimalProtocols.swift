//
//  AnimalProtocols.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//


protocol AnimalPresenterProtocol: AnyObject {
    var view: AnimalViewProtocol! { get set }
    var interactor: AnimalIneractorInputProtocol! { get set }
    var router: AnimalRouterProtocol! { get set }
    func viewDidLoad()
}

protocol AnimalIneractorOutputProtocol: AnyObject {

}

protocol AnimalIneractorInputProtocol: AnyObject {
    func getAnimals()
    func removeAnimal(animal: AnimalEntity)
    func editAnimal(animal: AnimalEntity)
    func addAnimal(animal: AnimalEntity)
    var presenter: AnimalIneractorOutputProtocol! { get set }

}

protocol AnimalRouterProtocol: AnyObject {

}

protocol AnimalViewProtocol: AnyObject {
    var presenter: AnimalPresenterProtocol! { get set }

}
