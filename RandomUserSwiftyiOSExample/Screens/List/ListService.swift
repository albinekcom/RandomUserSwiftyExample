import Foundation

final class ListService {
    
    private let apiService: APIService
    private let usersStorage: UsersStorage
    
    init(apiService: APIService, usersStorage: UsersStorage) {
        self.apiService = APIService()
        self.usersStorage = usersStorage
    }
    
    func fetchNewUsers(_ completion: @escaping (Error?) -> Void) {
        apiService.request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { [weak self] (response, error) in
            guard let results = response?.results else {
                completion(error)
                return
            }
            
            let users = UserFactory.makeUsers(from: results)
            
            self?.usersStorage.replaceUsers(with: users)
            
            completion(error)
        }
    }
    
    func getUsers(isFavoriteModeEnabled: Bool, filterString: String) -> [User] {
        var users = usersStorage.allUsers
        
        if isFavoriteModeEnabled {
            users = users.filter { $0.isFavorite }
        }
        
        if !filterString.isEmpty {
            users = users.filter { $0.firstName?.contains(filterString) == true || $0.lastName?.contains(filterString) == true }
        }
        
        return users
    }
    
    func getAllUsers() -> [User] {
        return usersStorage.allUsers
    }
    
    func removeUser(at index: Int) {
        usersStorage.removeUser(at: index)
    }
    
}
