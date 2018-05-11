//
//  HabitFollwerCell.swift
//  GOQiiNative
//
//  Created by Soyal on 08/05/18.
//  Copyright © 2018 GOQii. All rights reserved.
//

import UIKit

protocol HabitFollwerCellDelegate: class
{
    func tapped(_ index:Int)

}

class HabitFollwerCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
        var delegate : HabitFollwerCellDelegate?
        var userImageUrlArray :NSMutableArray = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        
                collectionView.register(UINib(nibName: "HabitFollowerCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "HabitFollowerCollectionViewCell")
                collectionView.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
               // collectionView!.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.collectionView.collectionViewLayout = flowLayout;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reloadView()
    {
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20.0, height: 20.0)
    }


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HabitFollowerCollectionViewCell", for: indexPath) as! HabitFollowerCollectionViewCell
        

            
            cell.userImage.contentMode = .scaleAspectFill

        
        
//            if let url = URL(string: ( (profilesArray.object(at: indexPath.row - 1) as! NSDictionary).value(forKey: "userImage") as! String)){
//                if url == URL(string: "") {
//                    cell.userImage.image = UIImage(named: "user_placeholder")
//                } else {
//                    cell.userImage?.image = nil
//                    cell.userImage?.setImageWith(nil, placeholderImage: UIImage(named: "user_placeholder"))
//                    cell.userImage?.setImageWith(url, placeholderImage: UIImage(named: "user_placeholder"))
//                }
//            } else {
//                cell.userImage.image = UIImage(named: "user_placeholder")
//            }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let _ = delegate{
            delegate?.tapped(indexPath.row)
        }
        
    }
}
