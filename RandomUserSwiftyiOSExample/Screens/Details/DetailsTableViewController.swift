import UIKit

final class DetailsTableViewController: UITableViewController {
    
    var user: User?
    
    // MARK: - Managing View
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Move it later
        let textLabelString: String?
        let detailTextLabel: String?
        
        if indexPath.row == 0 {
            textLabelString = "First Name"
            detailTextLabel = user?.firstName
        } else if indexPath.row == 1 {
            textLabelString = "Last Name"
            detailTextLabel = user?.lastName
        } else if indexPath.row == 2 {
            textLabelString = "Gender"
            detailTextLabel = user?.gender
        } else if indexPath.row == 3 {
            textLabelString = "e-mail"
            detailTextLabel = user?.email
        } else if indexPath.row == 4 {
            textLabelString = "Phone"
            detailTextLabel = user?.phone
        } else if indexPath.row == 5 {
            textLabelString = "Cell phone"
            detailTextLabel = user?.cell
        } else {
            textLabelString = nil
            detailTextLabel = nil
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath)
        
        cell.textLabel?.text = textLabelString
        cell.detailTextLabel?.text = detailTextLabel
        
        return cell
    }
    
}
