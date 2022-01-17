//
//  ItemProtocols.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import Foundation

protocol ItemTableViewProtocol: AnyObject {
    func removeItem(item: ItemEntity)
    func editItem(item: ItemEntity)
}

protocol ItemPresenterConfigurationProtocol: AnyObject {
    var view: ItemViewProtocol! { get set }
    var interactor: ItemInteractorInputProtocol! { get set }
    var router: ItemRouterProtocol! { get set }
}

protocol ItemPresenterProtocol: AnyObject {

    func viewDidLoad()
    func removeItem(item: ItemEntity)
    func addItem(name: String, type: String)
    func editeItem(name: String, type: String, id: String)
}

protocol ItemPresenterOutputProtocol: AnyObject {
    func getSavedItems(items: [ItemEntity])
}

protocol ItemInteractorInputProtocol: AnyObject {
    var presenter: ItemPresenterOutputProtocol! { get set }
    func getItems()
    func removeItem(item: ItemEntity)
    func editeItem(item: ItemEntity)
    func saveItem(item: ItemEntity)
}

protocol ItemRouterProtocol: AnyObject {}

protocol ItemViewProtocol: AnyObject {
    var presenter: ItemPresenterProtocol! { get set }
    func updateArrayItems(items: [ItemEntity])
}
