//
//  TableViewCell3.swift
//  CollectionViewInTableVoiew
//
//  Created by BridgeLabz on 09/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

protocol TableViewCell3Delegate: class
{
    func tapped(_ index:Int)

}
class TableViewCell3: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var labelArray = ["Panda","Skeleton","Owl","Monkey"]
    var imageArray = ["creature-panda-fun","creature-skeleton-happy","creature-owl-attack-1","creature-monkey-happy"]
    var delegate : TableViewCell3Delegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 112.0, height: 114.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let customcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        customcell.label.text = "\(indexPath.row)"
        
        if indexPath.row % 2 == 0{
            customcell.backgroundColor = UIColor.red
        }else{
            customcell.backgroundColor = UIColor.green
        }
//        let cellimage = imageArray[indexPath.row]
//        customcell.image.image = UIImage(named : cellimage)
  
        return customcell
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        print(indexPath.row)

        if let _ = delegate{
            print(indexPath.row)
            delegate?.tapped(indexPath.row)
            
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
