//
//  ViewController.swift
//  MultipleTableViewOnSingleViewController
//
//  Created by BridgeLabz on 11/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var segOut: UISegmentedControl!
    
    @IBAction func segmentPress(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    var fruitArray = ["Apple","Mango","Cherry","Banana","Watermelon"]
    var vegeArray = ["Cabbage","Cauliflower","Capsicum","Beetroot","Pumpkin"]
    var animalArray = ["Dog","Tiger","Lion","Cat","Elephant","Monkey","Panda"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segOut.selectedSegmentIndex == 0{
            return animalArray.count
        }else if segOut.selectedSegmentIndex == 1 {
            return fruitArray.count
        }
        else{
            return vegeArray.count
        }
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        if segOut.selectedSegmentIndex == 0 {
            cell.label.text = animalArray[indexPath.row]
            return cell
        }else if segOut.selectedSegmentIndex == 1 {
            cell.label.text = fruitArray[indexPath.row]
            return cell
        }else{
            cell.label.text = vegeArray[indexPath.row]
            return cell
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

