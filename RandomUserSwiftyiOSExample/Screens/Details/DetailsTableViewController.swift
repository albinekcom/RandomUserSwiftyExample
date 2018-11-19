import UIKit

final class DetailsTableViewController: UIViewController {

    var user: User?

    let presenter = DetailsPresenter()
    
}

extension DetailsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.detailsViewModels.count
    }
    
}

extension DetailsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailsViewModel = presenter.detailsViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath)
        
        cell.textLabel?.text = detailsViewModel.textLabelText
        cell.detailTextLabel?.text = detailsViewModel.detailsLabelText
        
        return cell
    }
    
}
