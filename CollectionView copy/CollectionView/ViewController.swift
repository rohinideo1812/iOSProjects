//
//  ViewController.swift
//  CollectionView
//
//  Created by BridgeLabz on 08/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView!
    
    var textArray = ["Monkey","Owl","Panda","Skeleton","Twin Monkey","Twin Owl","Twin Panda","Twin Skeleton"]
    var imageArray = ["creature-monkey-happy","creature-owl-attack-1","creature-panda-fun","creature-skeleton-happy","creature-monkey-happy","creature-owl-attack-1","creature-panda-fun","creature-skeleton-happy"]
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let imageData = imageArray[indexPath.item]
        let textData = textArray[indexPath.item]
        cell.imageView.image = UIImage(named : imageData)
        cell.label.text = textData
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5

            cell.layer.cornerRadius = cell.frame.size.height / 2

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        let layout = self.collectionView.collectionViewLayout
//        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
//        layout.minimumInteritemSpacing = 5
//        layout.itemSize = CGSize(width : (self.collectionView.frame.size.width - 20)/2,height :(self.collectionView.frame.size.height/3) )
    }

}

