//
//  ViewUtil.swift
//  FundooNotes
//
//  Created by BridgeLabz on 25/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit

class viewUtil : UIViewController {
    
    static var shareInstance = viewUtil()
   
    
    //MARK:Alert Message Display
    func alertMessageDisplay(target:UIViewController, title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        target.present(alert, animated: true)
    }
    
}
