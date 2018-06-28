//
//  AddPersonViewController.swift
//  AlamofireDemo
//
//  Created by BridgeLabz on 26/06/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit
import Alamofire

class AddPersonViewController: UIViewController {

    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var fistName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }

    @IBAction func AddBtnPress(_ sender: UIButton) {
        Alamofire.request("http://192.168.0.23:8181/fundooNotes/v1/addPerson",method: .post,parameters: ["lastName":secondName.text!,"city":city.text!,"mobileNumber":mobileNumber.text!,"firstName":fistName.text!], headers: [:])
            .responseJSON(completionHandler: { response in
                
                print(
                    response.result.description)
                
            })
    }
    

}
