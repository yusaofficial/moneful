//
//  ViewController.swift
//  moneful
//
//  Created by 吉村勇作 on 2019/08/25.
//  Copyright © 2019 yoshimurayusaku. All rights reserved.
//

import UIKit
import BEMCheckBox

var title: String?


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BEMCheckBoxDelegate {
  
    var feedTodo = [String]()
    var date = [Date]()
    
    var number : Int = 0
    
    
    @IBOutlet weak var MyButton : UIButton!
    @IBOutlet weak var TableView : UITableView!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        if UserDefaults.standard.object(forKey: "TodoList") != nil {
//            feedTodo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
//        }
        
        let nib = UINib(nibName: "FeedCheckTableViewCell", bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: "FeedCheckTableViewCell")
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCheckTableViewCell") as! FeedCheckTableViewCell
        //変数の中身を作る
        cell.feedLabel.text = feedTodo[indexPath.row]
        
        cell.checkBox.tag = indexPath.row
        cell.checkBox.delegate = self
        
        //戻り値の設定（表示する中身)
        return cell
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
            
    
            // テキストとDateの取得
           let removedText = feedTodo[indexPath.row]
           let removedDate = date[indexPath.row]
            
            // 削除前のテキストとDateを削除する
         feedTodo.remove(at: indexPath.row)
            date.remove(at: indexPath.row)
            
            // 削除後のテキストとDateを挿入する
          feedTodo.insert(removedText, at: indexPath.row)
            date.insert(removedDate, at: indexPath.row)
            
            // UserDefaultsの更新
            UserDefaults.standard.set(feedTodo, forKey: "TodoList")
            UserDefaults.standard.set(date, forKey: "TodoDate")
            
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
            date.remove(at: indexPath.row)
            
            TableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            
            UserDefaults.standard.set( feedTodo, forKey: "TodoList" )
            UserDefaults.standard.set(date, forKey: "TodoDate")
        }
    }
    

    func didTap(_ checkBox: BEMCheckBox) {
        // なんばんめのcheckBoxがタップされたか
        print(checkBox.tag, feedTodo[checkBox.tag])
        
        print(checkBox.tag, date[checkBox.tag])
        
        number = number + 1
        
        // userdefaultsに保存
        let ud = UserDefaults.standard
        ud.set(number, forKey: "Number")
        ud.synchronize()
    }
    
    
    
}

