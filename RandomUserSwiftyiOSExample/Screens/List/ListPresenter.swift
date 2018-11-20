import Foundation
import UIKit

final class ListPresenter {
    
    private let service = ListService(apiService: APIService(), usersStorage: (UIApplication.shared.delegate as! AppDelegate).usersStorage)
    
    func getListViewModels(isFavoriteModeEnabled: Bool, filterString: String) -> [ListViewModel] {
        let users = service.getUsers(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        var listViewModels = [ListViewModel]()
        
        for user in users {
            let textLabelText = user.isFavorite ? "♥️ \(user.firstName ?? "")" : "\(user.firstName ?? "")"
            let favoriteButtonTitle = user.isFavorite ? "💔" : "♥️"
            
            let listViewModel = ListViewModel(textLabelText: textLabelText, detailsLabelText: user.lastName, favoriteButtonTitle: favoriteButtonTitle)
            
            listViewModels.append(listViewModel)
        }
        
        return listViewModels
    }
    
    func refresh(completion: @escaping ((Error?) -> Void)) {
        service.fetchUsers(completion)
    }
    
    func getFavoriteButtonTitle(isFavoriteModeEnabled: Bool) -> String {
        return isFavoriteModeEnabled ? "♥️" : "💙"
    }
    
    func toggleFavoriteForUser(at index: Int, isFavoriteModeEnabled: Bool, filterString: String) {
        let user = getUser(at: index, isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        user.toggleFavorite()
    }
    
    func removeUser(at index: Int, isFavoriteModeEnabled: Bool, filterString: String) {
        let user = getUser(at: index, isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        let allUsers = service.getAllUsers()
        
        guard let index = allUsers.firstIndex(where: {$0 === user}) else { return }
        
        service.removeUser(at: index)
    }
    
    func getUser(at index: Int, isFavoriteModeEnabled: Bool, filterString: String) -> User {
        let users = service.getUsers(isFavoriteModeEnabled: isFavoriteModeEnabled, filterString: filterString)
        
        return users[index]
    }

}
