//
//  CheckTableViewCell.swift
//  
//
//  Created by 吉村勇作 on 2019/11/10.
//

import UIKit
import BEMCheckBox

class CheckTableViewCell: UITableViewCell {
    
    @IBOutlet var checkBox: BEMCheckBox!
    @IBOutlet var sampleLabel: UILabel!
    
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
