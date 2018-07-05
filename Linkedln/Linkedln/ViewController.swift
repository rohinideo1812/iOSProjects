import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,TableViewCellDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    let tableViewCell : TableViewCell! = nil
    let collectionViewCell : CollectionViewCell! = nil
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
       self.collectionView.delegate = self
       self.collectionView.dataSource = self
        var nib = UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
       self.collectionView.register(nib, forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        nib = UINib(nibName: "TableViewInCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "TableViewInCollectionViewCell")
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
            
            return cell
            
        }else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableViewInCollectionViewCell", for: indexPath) as! TableViewInCollectionViewCell
            cell.reloadView(indexPath: indexPath)
            return cell
            
        }
    
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath as IndexPath) as! ProfileCollectionViewCell
    
            return CGSize(width: cell.frame.size.width, height: cell.frame.size.height)
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableViewInCollectionViewCell", for: indexPath as IndexPath) as! TableViewInCollectionViewCell
            cell.delegate = self
            if  cell.tableView.contentSize.height > 0{
            return CGSize(width: cell.tableView.contentSize.width, height: cell.tableView.contentSize.height)
            }else{
                return CGSize(width: 375, height: 376)
            }
        }

    }
    
    
    func didEnteredText(indexPath:IndexPath) {
        
        let layout = UICollectionViewFlowLayout()
        let size = collectionView(collectionView: self.collectionView, layout: layout, sizeForItemAtIndexPath: indexPath)
        
    }
    

 }
