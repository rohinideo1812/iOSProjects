//
//  ProfileViewController.swift
//  SideView
//
//  Created by BridgeLabz on 30/04/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var name : String?
    var email : String?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       profileImage.layer.cornerRadius =
            profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        userIdLabel.text = "\(name)"
        nameLabel.text = "\(email)"
        
    }
}
