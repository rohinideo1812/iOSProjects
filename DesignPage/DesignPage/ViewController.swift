import UIKit
import SwipeMenuViewController

class ViewController: UIViewController,SwipeMenuViewDelegate,SwipeMenuViewDataSource,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var swipeView: SwipeMenuView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var middleview: UIView!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var leftBtn: UIButton!
    
    var array = ["TOP 100","CATEGORIES","RELEASES","COMPILE"]
    var colors = [UIColor.red,UIColor.yellow,UIColor.blue,UIColor.green]
    var textarray = ["Google LLC is an American multinational technology company that specializes in Internet-related services and products,","Google LLC is an American multinational technology company that specializes in Internet-related services and products, which include online advertising technologies, search engine, cloud computing, software, and hardware. Google was founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at ...","Google, Inc (NASDAQ: GOOG), is a U.S. public corporation, first estaiblisht as a privately-hauden corporation in 1998, that designed an guidit the Internet Google sairch ingine. Google is heidit at the Googleplex in Muntain View, Californie an haes owre 4,000 wankers in its employ. Dr. Eric Schmidt, ance CEO o Novell, wis ...","","earch engine, cloud computing, software, and hardware. Google was founded in","Search engine, cloud computing, software, and hardware. Google was founded in","Rohini","","earch engine, cloud computing, software, and hardware. Google was founded in"]

    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        descriptionLabel.numberOfLines = 2
        descriptionLabel.text = "Experemental electronic music pioneer.\nHalf of duo Way Out Best. Boss at Anjunadeep."
        image.layer.cornerRadius = image.frame.height/2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.backgroundColor = UIColor.red.cgColor
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOpacity = 0.3
        image.layer.shadowRadius = 7
        image.layer.shadowOffset = CGSize.zero
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red, UIColor.yellow]
        gradientLayer.frame = leftBtn.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        leftBtn.layer.insertSublayer(gradientLayer, at: 0)
        rightBtn.layer.borderColor = UIColor.blue.cgColor
        leftBtn.layer.cornerRadius = 15
        rightBtn.layer.cornerRadius = 15
        leftBtn.layer.borderWidth = 1
        rightBtn.layer.borderWidth = 1
        leftBtn.layer.shadowOpacity = 0.2
        leftBtn.layer.shadowRadius = 7
        leftBtn.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize.zero
        leftView.layer.borderColor = UIColor.lightGray.cgColor
        leftView.layer.borderWidth = 1
        middleview.layer.borderColor = UIColor.lightGray.cgColor
        middleview.layer.borderWidth = 1
        rightView.layer.borderColor = UIColor.lightGray.cgColor
        rightView.layer.borderWidth = 1
        swipeView.dataSource = self
        swipeView.delegate = self
        let options: SwipeMenuViewOptions = .init()
        swipeView.reloadData(options: options)
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension

   }

    func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return array[index]
    }
    
    func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return array.count
    }
    
    func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = SideViewController()
        vc.setColor(color: colors[index])
        return vc
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as! TableViewCell2
            cell.label.text = textarray[indexPath.row]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textarray.count
    }
    
 }

