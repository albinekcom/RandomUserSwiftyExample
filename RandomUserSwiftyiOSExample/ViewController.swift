import UIKit

final class ViewController: UIViewController {
    
    let usersStorage = UsersStorage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiService = APIService()
        
        let resultsCount = Configuration.resultsCount
        let apiVersion = Configuration.apiVersion
        
        apiService.request(.results(resultsCount, apiVersion: apiVersion)) { [weak self] (response, error) in
            guard let strongSelf = self else { return }
            guard let results = response?.results else { return }
            
            let users = UserFactory.makeUsers(from: results)
            strongSelf.usersStorage.replaceAllUsers(with: users)
            
            print("Users are: \(users)")
        }
    }
    
}
