//
//  ItemTableViewCell.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 05.01.2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .systemYellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
