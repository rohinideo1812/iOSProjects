//
//  AccountInfoViewController.swift
//  FoodApp
//
//  Created by BridgeLabz on 06/07/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit


class AccountInfoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //Mark:Properties
    @IBOutlet weak var tableView: UITableView!
    var info = ["fdgfdgfdg","dfgdfgdfgdf","dfgfdgfdgfdg","fgfdgfdg","fdgfdg","dfgdfgfdg","ghfghfg","fghfghgf","fdgfdgfdg","dfgdfgdfgdf","dfgfdgfdgfdg","fgfdgfdg","fdgfdg","dfgdfgfdg","ghfghfg","fghfghgf"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  self.tableView.register(UINib(nibName:"FavoritesTableViewCell",bundle:nil), forCellReuseIdentifier: "FavoritesTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
        cell.widthConstraintOfImg.constant = 0
        cell.label.text = info[indexPath.row]
        cell.label.textAlignment = .center
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 7
        cell.layer.shadowOffset = CGSize.zero
        return cell
    }
    
    
}
