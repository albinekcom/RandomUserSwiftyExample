import UIKit

final class ListTableViewController: UITableViewController {
    
    private let presenter = ListPresenter()
    
    private var indexOfSelectedUser: Int?
    private var isFavoriteModeEnabled = false
    private var filterString: String = ""
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: presenter.getFavoriteButtonTitle(isFavoriteModeEnabled: isFavoriteModeEnabled), style: .plain, target: self, action: #selector(favoriteTapped))
    }
    
    private func setupFavoriteButtonTitle() {
        navigationItem.rightBarButtonItem?.title = presenter.getFavoriteButtonTitle(isFavoriteModeEnabled: isFavoriteModeEnabled)
    }
    
    // MARK: - Actions
    
    @IBAction func refresh(_ sender: UIRefreshControl) {
        presenter.refresh() { [weak self] (_) in
            DispatchQueue.main.async { [weak self] in
                self?.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc private func favoriteTapped() {
        isFavoriteModeEnabled = !isFavoriteModeEnabled
        
        setupFavoriteButtonTitle()
        
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getListViewModels(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString).count
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listViewModel = presenter.getListViewModels(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath)
        
        cell.textLabel?.text = listViewModel.textLabelText
        cell.detailTextLabel?.text = listViewModel.detailsLabelText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        indexOfSelectedUser = indexPath.row
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = getDeleteRowAction(tableView, editActionsForRowAt: indexPath)
        let favorite = getFavoriteRowAction(tableView, editActionsForRowAt: indexPath)
        
        return [delete, favorite]
    }
    
    private func getDeleteRowAction(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> UITableViewRowAction {
        return UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
            guard let strongSelf = self else { return }
            
            strongSelf.presenter.removeUser(at: indexPath.row, isFavoriteModeEnabled: strongSelf.isFavoriteModeEnabled, filterString: strongSelf.filterString)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    private func getFavoriteRowAction(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> UITableViewRowAction {
        let listViewModel = presenter.getListViewModels(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)[indexPath.row]
        
        let favorite = UITableViewRowAction(style: .default, title: listViewModel.favoriteButtonTitle) { [weak self] (action, indexPath) in
            guard let strongSelf = self else { return }
            
            self?.presenter.toggleFavoriteForUser(at: indexPath.row, isFavoriteModeEnabled: strongSelf.isFavoriteModeEnabled, filterString: strongSelf.filterString)
            
            tableView.reloadRows(at: [indexPath], with: .right)
        }
        
        favorite.backgroundColor = .yellow
        
        return favorite
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsTableViewController = segue.destination as? DetailsTableViewController,
            let indexOfSelectedUser = indexOfSelectedUser else {
                return
        }
        
        detailsTableViewController.presenter.user = presenter.getUser(at: indexOfSelectedUser, isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
    }
    
}

extension ListTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterString = searchText.lowercased()
        
        tableView.reloadData()
    }
    
}
