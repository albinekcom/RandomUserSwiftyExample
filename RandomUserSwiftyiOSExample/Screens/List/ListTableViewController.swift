import UIKit

final class ListTableViewController: UITableViewController {
    
    private let usersStorage = UsersStorage()
    private var selectedUserIndex: Int?
    
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
        
        // TODO: Clean it
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        
        var prefix = ""
        if user.isFavorite {
            prefix = "♥️"
        }
        
        cell.textLabel?.text = prefix + user.firstName!
        cell.detailTextLabel?.text = user.lastName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedUserIndex = indexPath.row
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // TODO: Clean it
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
            guard let strongSelf = self else { return }

            strongSelf.usersStorage.removeUser(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let user = usersStorage.getUser(at: indexPath.row)
        
        let favoriteTitle: String
        
        if user.isFavorite {
            favoriteTitle = "💔"
        } else {
            favoriteTitle = "♥️"
        }

        let favorite = UITableViewRowAction(style: .default, title: favoriteTitle) { [weak self] (action, indexPath) in
            guard let strongSelf = self else { return }

            let user = strongSelf.usersStorage.getUser(at: indexPath.row)
            user.toggleFavorite()

            tableView.reloadRows(at: [indexPath], with: .right)
        }

        favorite.backgroundColor = .yellow

        return [delete, favorite]
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsTableViewController = segue.destination as? DetailsTableViewController else { return }
        guard let selectedUserIndex = selectedUserIndex else { return }
        
        detailsTableViewController.user = usersStorage.getUser(at: selectedUserIndex)
    }
    
}
