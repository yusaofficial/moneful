//
//  RecordViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/11/23.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var numberLabel : UILabel!
    
    var passedNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let ud = UserDefaults.standard
              passedNumber = ud.integer(forKey: "Number")

              numberLabel.text = String(passedNumber)
        
        UserDefaults.standard.set(passedNumber, forKey: "Number")
        
        if passedNumber <= 2 {
            titleLabel.text = "未熟な反省人"
        }
        if passedNumber > 2 {
            titleLabel.text = "見習い反省人"
        }
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
    }
    
   

    
    

}
