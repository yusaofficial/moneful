//
//  DetailViewController.swift
//  
//
//  Created by 吉村勇作 on 2019/11/03.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var dayLabel : UILabel!
    var selectedRow:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoDate") != nil {
            var dates = UserDefaults.standard.object(forKey: "TodoDate") as! [Date]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            
            
            dayLabel.text = "\(formatter.string(from: dates[selectedRow]))"
            
        }
  
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
