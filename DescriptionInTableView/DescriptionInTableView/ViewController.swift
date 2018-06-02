//
//  ViewController.swift
//  DescriptionInTableView
//
//  Created by BridgeLabz on 02/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

struct Model {
    var isExpanded : Bool
    let description : String
    let title : String
    }

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,tableViewSetDelegate {
    func didBtnSelect(indexPath: IndexPath) {
        print("Btn Clicked")
        self.model[indexPath.row].isExpanded = !self.model[indexPath.row].isExpanded
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    var model : [Model]  = [Model(isExpanded: false, description: "fdsdfdgbdfjgbfdkjbgkfjbgkfjdbgkjdfbgkjdfgdfgdfgdfgdfgbgkdjfbgkjbjbdfjkb", title: "1"),Model(isExpanded: false, description: "fdsdfdgbdfjgbfdkjbgkfjbgkfjdbgkjdfbgkjdfbgkdgdfgkjfhgkfjhgkfjdhgkdfjhgkjdfhgkjfdhgkjfdhgkjfdhgkjdfhgfgdfjfbgkjbjbdfjkb", title: "2"),Model(isExpanded: false, description: "fdsdfdgbdfjgbfdkjbgkfjbgkfjdbgkjdfbgkjdfbggdfgjndfjkgndfkjgnkdfjngkjdfnkgjnfdkjngdfkjngkjfdngjkfdngjkngjdnfgjkfdngkdjfbgkjbjbdfjkb", title: "3"),Model(isExpanded: false, description: "fdsdfdgbdfjgbfdkjbgkfjbgkfjdbgkjdfbgkjdfbgdgdfgndfkjgdfkgdfkjgkdfgkdfjgkdfjbgdfkjgbdkfjgdkfgbdkfjbgdkjbgkdjbgkdfjbgkdfjbgkdfjgkjdbgkjdfbgkjdfbgdfgdfgdfgdfkdjfbgkjbjbdfjkb", title: "4"),Model(isExpanded: false, description: "fdsdfdgbdfjgbfdkjbgkfjbgkfjdbgkjdfbgkjdfbgkdjdjfhgdhgkhgkjghkjdhgkghdkfjghdfkjghdfkjhgdfgdfgfdgdfgfbgkjbjbdfjkb", title: "5")]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let title = model[indexPath.row].title
        cell.labelField.numberOfLines = 0
        if model[indexPath.row].isExpanded {
            cell.labelField.text = title + " \n" + model[indexPath.row].description
        } else {
            cell.labelField.text = title
        }
        cell.btn.setTitle(">", for: .normal)
        cell.delegate = self
        cell.indexpath = indexPath
        cell.selectionStyle = .none
        
        return cell
    }

}

