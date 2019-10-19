//
//  ViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/08/25.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var MyButton : UIButton!
    @IBOutlet weak var TableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
       
       
        
    }
    
   // override func setEditing(_ editing: Bool, animated: Bool) {
 //       super .setEditing(editing, animated: animated)
 //       TableView.isEditing = editing
 //   }


    @IBAction func mainmove(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }

    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = feedTodo[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return feedTodo.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        // アイテム削除処理
        feedTodo.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        
    }
    
    
   
    
    

}

