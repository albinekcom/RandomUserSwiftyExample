import Foundation
import UIKit

final class ListPresenter {
    
    var isFavoriteModeEnabled = false {
        didSet {
            refreshListViewModels()
        }
    }
    
    var filterString: String = "" {
        didSet {
            refreshListViewModels()
        }
    }
    
    private(set) var listViewModels: [ListViewModel] = [ListViewModel]()
    
    private let service = ListService(apiService: APIService(), usersStorage: (UIApplication.shared.delegate as! SceneDelegate).usersStorage)
    
    func fetchNewUsers(completion: @escaping ((Error?) -> Void)) {
        service.fetchNewUsers { [weak self] (error) in
            self?.refreshListViewModels()
            
            completion(error)
        }
    }
    
    func getFavoriteButtonTitle() -> String {
        return isFavoriteModeEnabled ? "♥️" : "💙"
    }
    
    func toggleFavoriteForUser(at index: Int) {
        let user = getUser(at: index)
        
        user.toggleFavorite()
        
        refreshListViewModels()
    }
    
    func removeUser(at index: Int) {
        let user = getUser(at: index)
        let allUsers = service.getAllUsers()
        
        guard let index = allUsers.firstIndex(where: {$0 === user}) else { return }
        
        service.removeUser(at: index)
        
        refreshListViewModels()
    }
    
    func getUser(at index: Int) -> User {
        let users = service.getUsers(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        return users[index]
    }
    
    private func refreshListViewModels() {
        let users = service.getUsers(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        listViewModels = [ListViewModel]()
        
        for user in users {
            let textLabelText = user.isFavorite ? "♥️ \(user.firstName ?? "")" : "\(user.firstName ?? "")"
            let favoriteButtonTitle = user.isFavorite ? "💔" : "♥️"
            
            let listViewModel = ListViewModel(textLabelText: textLabelText, detailsLabelText: user.lastName, favoriteButtonTitle: favoriteButtonTitle)
            
            listViewModels.append(listViewModel)
        }
    }

}
