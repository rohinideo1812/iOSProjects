import UIKit


struct NoteItem:Codable {
    
    let id : Int?
    let subtitle : String?
    let createDate : String?
    let title : String?
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://api.gabethecoder.com/feed") else { return print("URL Error") }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else { return print("Network Error") }
            
            do {
                let posts = try JSONDecoder().decode([NoteItem].self, from: data!)
                print(posts)
            } catch {
                print(error.localizedDescription)
                
            }
        }
  }
}
