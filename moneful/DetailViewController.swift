//
//  DetailViewController.swift
//  
//
//  Created by 吉村勇作 on 2019/11/03.
//

import UIKit

class DetailViewController: UIViewController {

    var timer : Timer!
    
    @IBOutlet weak var dayLabel : UILabel!
    var selectedRow:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoDate") != nil {
            let dates = UserDefaults.standard.object(forKey: "TodoDate") as! [Date]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            
            
            dayLabel.text = "\(formatter.string(from: dates[selectedRow]))"
            
        }
        
     //   Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(DetailViewController.timerUpdate), userInfo: nil, repeats: true)
        
    }
    
 //   @objc func timerUpdate() {
 //         print("update")
 //     }
    
    // 今日の日付を取得
    func getToday(format:String = "yyyy年MM月dd日") -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    
    // 指定日と今日の差を取得
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
