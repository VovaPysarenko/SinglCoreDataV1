//
//  ItemPresenter.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import Foundation

class ItemPresenter: ItemPresenterConfigurationProtocol {
    
    weak var view: ItemViewProtocol!
    var interactor: ItemInteractorInputProtocol!
    var router: ItemRouterProtocol!
}

// MARK: - Extensions
extension ItemPresenter: ItemPresenterProtocol {
    
    func viewDidLoad() {
        interactor.getItems()
    }
    
    func addItem(name: String, type: String) {
        let item = ItemEntity(id: UUID().uuidString, name: name, type: type, timestamp: Int(Date().currentTimeMillis()))
        interactor.saveItem(item: item)
    }
    
    func editeItem(name: String, type: String, id: String) {
        let newItem = ItemEntity(id: id, name: name, type: type, timestamp: Int(Date().currentTimeMillis()))
        interactor.editeItem(item: newItem)
    }
    
    func removeItem(item: ItemEntity) {
        interactor.removeItem(item: item)
    }
}

extension ItemPresenter: ItemPresenterOutputProtocol {
    func getSavedItems(items: [ItemEntity]) {
        self.view.updateArrayItems(items: items)
    }
}


