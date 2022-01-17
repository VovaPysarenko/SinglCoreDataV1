//
//  ItemViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import UIKit

class ItemViewController: UIViewController {
    
    @IBOutlet weak var itemTableView: ItemTableView!
    var presenter: ItemPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        let nibName  = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTableView.register(nibName, forCellReuseIdentifier: "ItemTableViewCell")
        itemTableView.delegate = itemTableView
        itemTableView.dataSource = itemTableView
        itemTableView.itemProtocol = self
        presenter.viewDidLoad()
    }
    
    @IBAction func addItemPtessed(_ sender: Any) {
        let alertController = UIAlertController(title: "Item", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Type"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textFields = alertController.textFields else {return}
            guard let name = textFields[0].text else {return}
            guard let type = textFields[1].text else {return}
            self.presenter.addItem(name: name, type: type)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension ItemViewController: ItemTableViewProtocol {
    func removeItem(item: ItemEntity) {
        presenter.removeItem(item: item)
    }
    
    func editItem(item: ItemEntity) {
        let alertController = UIAlertController(title: "Item", message: "", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.text = item.name
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.text = item.type
            textField.placeholder = "Type"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textFields = alertController.textFields else {return}
            guard let name = textFields[0].text else {return}
            guard let type = textFields[1].text else {return}
            guard let id = item.id else {return}
            self.presenter.editeItem(name: name, type: type, id: id)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ItemViewController: ItemViewProtocol {
    func updateArrayItems(items: [ItemEntity]) {
        self.itemTableView.items = items
        self.itemTableView.reloadData()
    }
}
