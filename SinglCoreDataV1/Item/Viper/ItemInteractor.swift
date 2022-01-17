//
//  ItemInteractor.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import Foundation

class ItemInteractor: NSObject {
    weak var presenter: ItemPresenterOutputProtocol!
    var realmProvider = RealmProvider()
    var items = [ItemEntity]()
}

// MARK: - Extensions
extension ItemInteractor: ItemInteractorInputProtocol {
    func getItems() {
        self.items = realmProvider.getObject()
        self.presenter.getSavedItems(items: self.items)
    }
    
    func saveItem(item: ItemEntity) {
        self.items = self.realmProvider.saveObject(item)
        self.presenter.getSavedItems(items: self.items)
    }
    
    func editeItem(item: ItemEntity) {
        for value in self.items{
            if value.id == item.id {
                let newItem = ItemEntity(id: value.id, name: item.name, type: item.type, timestamp: Int(Date().currentTimeMillis()))
                self.items = self.realmProvider.editObject(newItem)
                self.presenter.getSavedItems(items: items)
            }
        }
    }
    
    func removeItem(item: ItemEntity) {
        self.realmProvider.removeObject(item)
    }
}

