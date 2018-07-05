import UIKit

class TableViewCell1: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var colectionView: UICollectionView!
    
    let colors = [UIColor.blue,UIColor.red,UIColor.yellow,UIColor.orange,UIColor.purple]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        colectionView.delegate = self
        colectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.colectionView.frame.size.width - 24)/3
        print("self.colectionView.frame.size.height = ",self.colectionView.frame.size.height)
        return CGSize(width: width, height: self.colectionView.frame.size.height)
    }
    
}
