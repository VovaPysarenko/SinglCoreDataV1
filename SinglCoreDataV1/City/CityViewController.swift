//
//  CityViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 19.01.2022.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet weak var cityTableView: CityTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    @IBAction func addCityPresed(_ sender: Any) {
        present(AddCityViewController(), animated: true)
    }
    
    private func setup() {
        let nibName  = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(nibName, forCellReuseIdentifier: "CityTableViewCell")
        cityTableView.delegate = cityTableView
        cityTableView.dataSource = cityTableView
    }
}

