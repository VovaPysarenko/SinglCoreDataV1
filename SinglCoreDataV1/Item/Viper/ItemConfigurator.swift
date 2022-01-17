//
//  ItemConfigurator.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import UIKit

class ItemConfigurator {
    static func create() -> UIViewController {
        let view = ItemViewController()
        let presenter = ItemPresenter()
        let interactor = ItemInteractor()
        let router = ItemRouter()
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return view
    }
}
