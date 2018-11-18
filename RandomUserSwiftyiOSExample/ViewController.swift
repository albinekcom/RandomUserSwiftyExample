import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiService = APIService()
        
        apiService.request(.results(1)) { (users, error) in
           print("Random users: \(users!)")
        }
    }
    
}
