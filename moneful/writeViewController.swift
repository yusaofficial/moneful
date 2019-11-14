//
//  writeViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/09/05.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import RealmSwift

 var feedTodo = [String]()


class writeViewController: UIViewController, UITextFieldDelegate {
    
    var date = ""
    
    var datePicker = UIDatePicker()
    
    var timer : Timer!
    
    let date2 = DateManager()
    
    
    @IBOutlet weak var writeTextField : UITextField!
    @IBOutlet weak var dateTextField : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ピッカー設定
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.locale = Locale.current
        datePicker.locale = Locale(identifier: "ja_JP")
        dateTextField.inputView = datePicker
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            feedTodo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
        
       
        
        // プレースホルダー
        dateTextField.placeholder = "改善期限を設定"
        
        writeTextField.placeholder = "反省することを入力"
    }
    
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        writeTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    writeTextField.resignFirstResponder()
    return true
    }
    
    // 「完了」を押すと閉じる
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        dateTextField.resignFirstResponder()
        
    }
    
    
    // 決定ボタン押下
    @objc func done() {
        dateTextField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        dateTextField.text = "\(formatter.string(from: datePicker.date))"
        
    }
    
    @IBAction func TodoAddButten(_ sender: Any) {
        //変数に入力内容を入れる
        feedTodo.append(writeTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        writeTextField.text = ""
        //変数の中身をUDに追加
       UserDefaults.standard.set( feedTodo, forKey: "TodoList" )
        
        
     
        self.navigationController?.popToRootViewController(animated: true)
    }
    
  //  override func viewWillAppear(_ animated: Bool) {
        //カウントダウン
 //       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
 //       timer.fire()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        timer.invalidate()
//        timer = nil
//    }
    
//    @objc func update(tm: Timer) {
        
//        let count: String = datePicker.date()
//        let count2: TimeInterval = TimeInterval(count) as! TimeInterval
//        let formatter = DateComponentsFormatter()
        
        // 表示フォーマットを変更．.positionalや.fullで表示が変わります．
//        formatter.unitsStyle = .brief
        // 使用する単位　.minuteのみにすると232,071minのように出力されます．
//        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        // 作成したformatterでtimeintervalをstringに変換します．
//        print(formatter.string(from: count2)!) // →5mths 10days 3hr 44min 28sec
        //時間をラベルに表示
      
//    }
 
    

}
