import UIKit

final class ListTableViewController: UITableViewController {
    
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

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersStorage.usersCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = usersStorage.getUser(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        cell.textLabel?.text = user.firstName
        cell.detailTextLabel?.text = user.lastName
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}
