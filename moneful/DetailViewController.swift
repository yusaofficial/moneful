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
    
    @IBOutlet weak var dfLabel : UILabel!
    
    var selectedRow : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "TodoDate") != nil {
            let dates = UserDefaults.standard.object(forKey: "TodoDate") as! [Date]
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            
            
            dayLabel.text = "\(formatter.string(from: dates[selectedRow]))"
            
            dfLabel.text = getToday()
        
        }
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DetailViewController.timerUpdate), userInfo: nil, repeats: true)
     
       
        
        
  
        
    }
    
  
    @objc func timerUpdate() {
        
   
         
      }
    
    // 今日の日付を取得
    func getToday(format:String = "yyyy年MM月dd日") -> String {

        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    

}

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
