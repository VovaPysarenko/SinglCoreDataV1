//
//  MainSideBarVC.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 25.07.2022.
//

import UIKit

class MainSideBarVC: UIViewController {
    
    @IBOutlet weak var tableView: LeftMenuTableView!
    @IBOutlet weak var selectedTableView: SelectTableView!
    @IBOutlet weak var sideMenu: UIView!
    @IBOutlet weak var sideMenuWidth: NSLayoutConstraint!
    var сallback: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: LeftMenuTableViewCell.identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: LeftMenuTableViewCell.identifier)
        tableView.delegate = tableView
        tableView.dataSource = tableView
        tableView.tableFooterView = UIView()
        self.navigationItem.setHidesBackButton(true, animated: false)
        sideMenuWidth.constant = 0
        sideMenu.layoutIfNeeded()
        self.tableView.сallback1  = { [weak self] constant in
            guard let self = self else {return}
            self.sideMenuWidth.constant = CGFloat(constant)
        }
    }
}
