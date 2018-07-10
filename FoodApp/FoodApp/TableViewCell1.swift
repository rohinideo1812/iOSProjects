/**********************************************************************
 *  Purpose: Custom Table Cell.
 *
 *  @author Rohini
 *  @version 4.0
 *  @since   10-07-2018
 *
 *********************************************************************/
import UIKit

class TableViewCell1: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    //Mark:Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imgArray = [UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake")]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.layer.backgroundColor = UIColor.red.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowOffset = CGSize.zero
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = imgArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = self.collectionView.frame.size.height
        return CGSize(width: height, height: height)
        
        
    }
   
}
