import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiService = APIService()
        
        let resultsCount = Configuration.resultsCount
        let apiVersion = Configuration.apiVersion
        
        apiService.request(.results(resultsCount, apiVersion: apiVersion)) { (results, error) in
            print("Results are: \(results!)")
        }
    }
    
}
