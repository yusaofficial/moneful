//
//  ViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/08/25.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import EAIntroView
import EARestrictedScrollView
import BEMCheckBox

var title: String?

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    var feedTodo = [String]()
    var date = [Date]()
    
    @IBOutlet weak var MyButton : UIButton!
    @IBOutlet weak var TableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        if UserDefaults.standard.object(forKey: "TodoList") != nil {
//            feedTodo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
//        }
        
        
        
        navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.TableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDiary") {
            let diaryView = segue.destination as! writeViewController
            diaryView.title = self.title
        }
        if (segue.identifier == "toDetailViewController") {
            let detailView = segue.destination as! DetailViewController
            detailView.selectedRow = (sender as! IndexPath).row
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            feedTodo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        
        }
        if UserDefaults.standard.object(forKey: "TodoDate") != nil {
            date = UserDefaults.standard.object(forKey: "TodoDate") as! [Date]
        }
        
        print(feedTodo)
        print(date)
       
    }
   
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // アクションを実装
        
        
        // タップされたセルの行番号を出力
        print("\(indexPath.row)番目の行が選択されました。")
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "toDetailViewController", sender: indexPath)

    }
    

    
  
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if tableView.isEditing {
            return .delete
        }
        
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        //移動されたデータを取得する。
        let movedText = feedTodo[sourceIndexPath.row]
        let movedDate = date[sourceIndexPath.row]
        //let moveData = tableView.cellForRowAtIndexPath(sourceIndexPath)?.textLabel!.text
        
        //元の位置のデータを配列から削除する。
        feedTodo.remove(at: sourceIndexPath.row)
        date.remove(at: sourceIndexPath.row)
        
        print(feedTodo)
        
        //移動先の位置にデータを配列に挿入する。
        feedTodo.insert(movedText, at:destinationIndexPath.row)
        
        //移動先の位置にデータを配列に挿入する。
        date.insert(movedDate, at:destinationIndexPath.row)
        print(feedTodo)
        
        UserDefaults.standard.set( feedTodo, forKey: "TodoList" )
        
        UserDefaults.standard.set( date, forKey: "TodoDate" )
        //tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        TableView.isEditing = editing
      
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            feedTodo.remove(at: indexPath.row)
            
            TableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            
            UserDefaults.standard.set( feedTodo, forKey: "TodoList" )
        }
    }
    

}

