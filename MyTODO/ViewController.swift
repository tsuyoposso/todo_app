//
//  ViewController.swift
//  MyTODO
//
//  Created by 長坂豪士 on 2019/08/29.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

//クラスの継承
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //表示するセル数を決める(UITableView, numberOfInSectionの追加)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値(表示するcell数)
        return todoKobetsuNoNakami.count
    }
    
    //表示するセルの中身を作成する(UITableView, cellForRowAtの追加)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //変数の作成 -------------------------------------------------------------------------------------↓小文字！
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を代入
        TodoCell.textLabel!.text = todoKobetsuNoNakami[indexPath.row]
        //戻り値
        return TodoCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //追加画面で入力した情報の取得
        //TodoListに情報があったらそれを受け渡す処理
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todoKobetsuNoNakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    //スワイプしたセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoKobetsuNoNakami.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }


}

