//
//  LeftMenuTableViewCell.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 25.07.2022.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    static let identifier = "LeftMenuTableViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
