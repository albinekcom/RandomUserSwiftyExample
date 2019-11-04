import Foundation

final class UserListRefreshService {
    
    let userData: UserData
    let apiService: APIService
    
    init(userData: UserData, apiService: APIService = APIService()) {
        self.userData = userData
        self.apiService = apiService
    }
    
    func refreshUsers() {
        apiService.request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { (response, error) in
            guard let results = response?.results, error == nil else { return }

            let usersFromResponseResults = UserFactory.makeUsers(from: results)
            
            DispatchQueue.main.async { [weak self] in
                self?.userData.allUsers = usersFromResponseResults
            }
        }
    }
    
}
