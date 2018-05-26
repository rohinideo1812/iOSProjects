//
//  ViewController.swift
//  MVPCoreData
//
//  Created by BridgeLabz on 07/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var array : [UserData] = []

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstName{
           firstName.resignFirstResponder()
            
        }else{
            secondName.resignFirstResponder()
        }
        return true
    }
    
    
    @IBAction func okButtonPress(_ sender: UIButton) {
        let userdata = UserData(firstName: firstName.text, lastName: secondName.text)
        presenter.insertUsers(object: userdata)
        presenter.getUsers(firstName: firstName.text, callback:{ isAvailable,object in
            print(object?.firstName)
            print(object?.lastName)
            array.append(object!)
            label.text = object?.firstName
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.label.text = array[indexPath.row] as? String
        return cell
    }
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var secondName: UITextField!
    var presenter = Presenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

}

