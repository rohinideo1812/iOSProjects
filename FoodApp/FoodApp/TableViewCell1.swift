import UIKit

class TableViewCell1: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {

    //Mark:Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var imgArray = [UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake"),UIImage(named: "img_shake2"),UIImage(named: "img_shake")]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = imgArray[indexPath.row]
        return cell
        
    }
   
}
