//
//  AnimalRouter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 22.12.2021.
//

import UIKit

class AnimalRouter: AnimalRouterProtocol {
    func goToItemScreen(from view: AnimalViewProtocol) {
        guard let viewController = view as? UIViewController else {return}
        let itemVC = ItemConfigurator.create()
        viewController.navigationController?.pushViewController(itemVC, animated: true)
    }
    
}
