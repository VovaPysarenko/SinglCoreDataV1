//
//  AnimalConfigurator.swift
//  SinglCoreDataV1
//
//  Created by Vladislav Nikolaychuk on 22.12.2021.
//

import Foundation
import UIKit

class AnimalConfigurator {
    
    static func create() -> UIViewController {
        var view = AnimalsListViewController()
        var presenter = AnimalPresenter()
        presenter.view = view
        view.presenter = presenter
        return view
    }
}
