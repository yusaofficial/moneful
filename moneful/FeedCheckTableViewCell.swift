//
//  FeedCheckTableViewCell.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/11/23.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import BEMCheckBox

class FeedCheckTableViewCell: UITableViewCell {
    
    @IBOutlet var checkBox: BEMCheckBox!
    @IBOutlet var feedLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBox.boxType = .square
        checkBox.animationDuration = 0.1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
