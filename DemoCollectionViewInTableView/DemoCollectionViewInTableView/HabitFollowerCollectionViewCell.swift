//
//  HabitFollowerCollectionViewCell.swift
//  GOQiiNative
//
//  Created by Azim on 5/9/18.
//  Copyright © 2018 GOQii. All rights reserved.
//

import UIKit

class HabitFollowerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.clipsToBounds = true
        userImage.layer.cornerRadius = userImage.frame.size.height / 2
    }

}
