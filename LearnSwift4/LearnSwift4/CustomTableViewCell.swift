//
//  CustomTableViewCell.swift
//  LearnSwift4
//
//  Created by Abdul Majeed K on 09/12/17.
//  Copyright © 2017 Wafa Fathima. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
