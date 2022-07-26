//
//  LeftMenuTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 25.07.2022.
//


import UIKit

typealias MenuBarModel = (i: MenuBarValues, b: UIImage)

class LeftMenuTableView: UITableView {
    
    let image = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4")]
    var сallback1: ((MenuBarModel) -> Void)?


}

extension LeftMenuTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("----BLABLA---- ")
        var ddd = MenuBarModel(.settings, UIImage(named: "1")!)
//        var fff = MenuBarModel(.settings, UIImage(named: "1"))
        self.сallback1?(ddd)
    }
    
}

extension LeftMenuTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height / CGFloat(image.count)
        return visibleSize.height / CGFloat(image.count)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuTableViewCell.identifier, for: indexPath) as? LeftMenuTableViewCell {
            let item = image[indexPath.row]
            cell.menuImage.image = item

            
            return cell
        }
        return UITableViewCell()
    }
    
    
}

enum MenuBarValues {
    case settings
    case overview
    case sound
    case vibro
}
