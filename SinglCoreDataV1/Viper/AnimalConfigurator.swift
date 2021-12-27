//
//  AnimalConfigurator.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import UIKit

class AnimalConfigurator {
    static func create() -> UIViewController {
        let view = AnimalsListViewController()
        let presenter: AnimalPresenterProtocol & AnimalIneractorOutputProtocol = AnimalPresenter()
        let interactor: AnimalIneractorInputProtocol = AnimalInteractor()
        let router: AnimalRouterProtocol = AnimalRouter()
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return view
    }
}
