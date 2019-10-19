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

    var datePicker = UIDatePicker()
    
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
        
        
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
        
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            feedTodo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        
        // プレースホルダー
        dateTextField.placeholder = "改善期限を設定"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        writeTextField.text = title
        
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
    
    

    

 
    
    
    

}