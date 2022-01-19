//
//  StartViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 18.01.2022.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func CDataPressed(_ sender: Any) {
        navigationController?.pushViewController(AnimalConfigurator.create(), animated: true)
    }
    
    @IBAction func realmPressed(_ sender: Any) {
        navigationController?.pushViewController(ItemConfigurator.create(), animated: true)
    }
    
    @IBAction func fireBasePressed(_ sender: Any) {
        navigationController?.pushViewController(CityViewController(), animated: true)
    }
    
}
