//
//  AnimalPresenter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

class AnimalPresenter {
    
    weak var view: AnimalViewProtocol!
    var interactor: AnimalIneractorInputProtocol!
    var router: AnimalRouterProtocol!
    
    func viewDidLoad() {
        interactor.getAnimals()
    }
}

extension AnimalPresenter : AnimalPresenterProtocol {

}

extension AnimalPresenter: AnimalIneractorOutputProtocol {
    
}

