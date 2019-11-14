//
//  DetailViewController.swift
//  
//
//  Created by 吉村勇作 on 2019/11/03.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DayLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       DayLabel.text = getToday(format:"yyyy年MM月dd日")
        
      
    }
    
    func getToday(format:String = "yyyy年MM月dd日") -> String {
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)

    }
    
    func getIntervalDays(date:Date?,anotherDay:Date? = nil) -> Double {
        
        var retInterval:Double!
        
        if anotherDay == nil {
            retInterval = date?.timeIntervalSinceNow
        } else {
            retInterval = date?.timeIntervalSince(anotherDay!)
        }
        
        let ret = retInterval/86400
        
        return floor(ret)  // n日
    }
    

    

}
