//
//  ProfileViewController.swift
//  SideView
//
//  Created by BridgeLabz on 30/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
   
    //Mark : IBOutlet
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //Properties
    var name : String?
    var email : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius =
        profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        if let name = name ,let email = email {
        userIdLabel.text = "\(email)"
        nameLabel.text = "\(name)"
        }
    }
}
