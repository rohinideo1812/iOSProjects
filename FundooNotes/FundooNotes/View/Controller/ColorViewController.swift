import UIKit

class ColorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let colorArray = [Constants.Color.blue,Constants.Color.brown,Constants.Color.colorBackgroundGrey,Constants.Color.colorBackgroundYellowLight,Constants.Color.colorGreenNormal,Constants.Color.colorIconTintGrey,Constants.Color.colorWhite,Constants.Color.darkBlue,Constants.Color.green,Constants.Color.grey,Constants.Color.orange,Constants.Color.pink,Constants.Color.purple,Constants.Color.red,Constants.Color.teal,Constants.Color.white,Constants.Color.yellow]
    let cellReuseIdentifier = "collectionCell"
    var delegate: ColorSelected? = nil

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        delegate?.colorSelected(color: colorArray[indexPath.row])
        self.dismiss(animated: true, completion: nil)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CustomViewCell
        cell.backgroundColor = UIColor(hexString: colorArray[indexPath.row])
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowRadius = 4.0
        cell.layer.cornerRadius = cell.frame.size.height / 2
        cell.layer.shadowOffset = CGSize.zero
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        let frame = CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.size.width, height: 55)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        self.view.backgroundColor = UIColor(white: 0.4, alpha: 0.8)
        self.view.addSubview(collectionView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
}

    class CustomViewCell: UICollectionViewCell {
        
        
    }
