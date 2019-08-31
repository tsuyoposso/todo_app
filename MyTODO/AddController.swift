//
//  AddControllerViewController.swift
//  MyTODO
//
//  Created by 長坂豪士 on 2019/08/29.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

//追加したTODOを格納する配列
var todos = [String]()

class AddController: UIViewController {

    //テキストフィールドの設定
    @IBOutlet weak var TodoTextField: UITextField!
    
    //追加ボタンのアクション
    @IBAction func TodoAddButton(_ sender: Any) {
        //テキストフィールドの入力値を配列に追加
        todos.append(TodoTextField.text!)
        //テキストフィールドをクリア
        TodoTextField.text = ""
        //変数の中身をUDに追加する
        //UD(UserDefaults) -> データベースを使うまでもないものを格納できる
        //forKey: -> 格納先の名前
        UserDefaults.standard.set(todos, forKey: "TodoList")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
