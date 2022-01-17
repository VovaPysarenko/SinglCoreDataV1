//
//  ItemTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import UIKit

class ItemTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items = [ItemEntity]()
    weak var itemProtocol: ItemTableViewProtocol?
    
    func timestampToDate(timestamp: Int64) -> String {
        let toDoubleTime = Double(timestamp) / 1000
        let date = Date(timeIntervalSince1970: toDoubleTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy HH:mm:ss"
        
        return formatter.string(from: date)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell {
            let item = items[indexPath.row]
            let time = timestampToDate(timestamp: Int64(item.timestamp))
            cell.nameLabel.text = item.name
            cell.typeLabel.text = item.type
            cell.dateLabel.text = time
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if editingStyle == .delete {
            self.itemProtocol?.removeItem(item: item)
            items.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        self.itemProtocol?.editItem(item: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



