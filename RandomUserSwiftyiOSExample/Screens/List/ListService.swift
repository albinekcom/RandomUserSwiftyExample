import Foundation

final class ListService {
    
    private let apiService = APIService()
    
    func fetch(_ completion: @escaping (_ users: [User]?) -> Void) {
        apiService.request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { (response, error) in
            guard let results = response?.results else {
                completion(nil)
                return
            }
            
            let users = UserFactory.makeUsers(from: results)
            
            completion(users)
        }
    }

}
