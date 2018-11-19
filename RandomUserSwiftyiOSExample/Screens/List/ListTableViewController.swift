import UIKit

final class ListTableViewController: UITableViewController {
    
    private let usersStorage = UsersStorage()
    private var selectedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService().request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { [weak self] (response, error) in
            guard let strongSelf = self, let results = response?.results else { return }
            
            let users = UserFactory.makeUsers(from: results)
            strongSelf.usersStorage.replaceAllUsers(with: users)
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
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedUser = usersStorage.getUser(at: indexPath.row)
        
        return indexPath
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsTableViewController = segue.destination as? DetailsTableViewController else { return }
        
        detailsTableViewController.user = selectedUser
    }
    
}
