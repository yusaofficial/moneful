//
//  DateManager.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/11/13.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import Foundation

class DateManager {

    private let formatter = DateFormatter()
    private let date = Date()
    private var dateStr: String?
    private let calendar = Calendar(identifier: .gregorian)
    
    init(){
        formatter.timeZone = TimeZone.ReferenceType.local
        formatter.dateFormat = "yyyy年MM月dd日"
        
        dateStr = ""
    }
    //現在時刻を返します"yyyy-MM-dd"
    func getNowDate() -> String{
        dateStr = formatter.string(from: date)
        guard let now = dateStr else { return ""}
        return now
    }


}
