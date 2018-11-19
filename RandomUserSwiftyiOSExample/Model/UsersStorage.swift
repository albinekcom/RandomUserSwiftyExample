import UIKit

class UsersStorage: NSObject {
    
    private var allUsers = [User]()
    
    func removeUser(at index: Int) {
        allUsers.remove(at: index)
    }
    
    func getUser(at index: Int) -> User {
        return allUsers[index]
    }
    
    func replaceAllUsers(with newUsers: [User]) {
        allUsers = newUsers
    }
    
    func changeUserFavoriteStatus(at index: Int) {
        let user = allUsers[index]
        
        user.toggleFavorite()
    }
}
