import UIKit

final class ListTableViewController: UITableViewController {
    
    private let usersStorage = (UIApplication.shared.delegate as! AppDelegate).usersStorage
    private var indexOfSelectedUser: Int?
    private let apiService = APIService()
    
    private var isFavoriteEnabled = false
    
    // MARK: - Table View Data Source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "♥️", style: .plain, target: self, action: #selector(favoriteTapped))
        
        setupFavoriteButtonTitle()
    }
    
    private func setupFavoriteButtonTitle() {
        if isFavoriteEnabled {
            navigationItem.rightBarButtonItem?.title = "♥️"
        } else {
            navigationItem.rightBarButtonItem?.title = "💙"
        }
    }
    
    @objc private func favoriteTapped() {
        isFavoriteEnabled = !isFavoriteEnabled
        
        setupFavoriteButtonTitle()
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFavoriteEnabled {
            return usersStorage.favoriteUsersCount
        } else {
            return usersStorage.usersCount
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user: User
        
        if isFavoriteEnabled {
            user = usersStorage.getFavoriteUser(at: indexPath.row)
        } else {
            user = usersStorage.getUser(at: indexPath.row)
        }
        
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
        indexOfSelectedUser = indexPath.row
        
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
            let user = self?.usersStorage.getUser(at: indexPath.row)
            user?.toggleFavorite()

            tableView.reloadRows(at: [indexPath], with: .right)
        }

        favorite.backgroundColor = .yellow

        return [delete, favorite]
    }
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        apiService.request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { [weak self] (response, error) in
            defer {
                self?.refreshControl?.endRefreshing()
            }
            
            guard let results = response?.results else { return }
            
            let users = UserFactory.makeUsers(from: results)
            self?.usersStorage.replaceUsers(with: users)
            
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsTableViewController = segue.destination as? DetailsTableViewController,
            let indexOfSelectedUser = indexOfSelectedUser else {
                return
        }
        
        detailsTableViewController.presenter.user = usersStorage.getUser(at: indexOfSelectedUser)
    }
    
}
