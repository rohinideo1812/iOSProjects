import UIKit

class ColorViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{

    //Mark :IBOutlet
    @IBOutlet weak var colorSelectionCV: UICollectionView!
    
    var colorArray =  [UIColor.red,UIColor.blue,UIColor.green,UIColor.blue,UIColor.purple,UIColor.brown,UIColor.gray]
//      var colorArray = ["","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSelectionCV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                colorSelectionCV.delegate = self
                colorSelectionCV.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = colorArray[indexPath.row]
        return cell
    }
}
