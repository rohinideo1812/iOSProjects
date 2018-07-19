import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dog = Dog()
        dog.age = 16
        dog.name = "Rohini Rahul"
 
        let realm = try! Realm()
        try! realm.write {
            realm.add(dog)
        }
        let dogs = realm.objects(Dog.self).count
        print(dogs)
    }

}

