import UIKit

final class UsersStorage {
    
    private let usersKey = "users"
    
    private var allUsers = [User]()
    
    private var favoriteUsers: [User] {
        return allUsers.filter { $0.isFavorite }
    }
    
    func removeUser(at index: Int) {
        allUsers.remove(at: index)
    }
    
    var usersCount: Int {
        return allUsers.count
    }
    
    var favoriteUsersCount: Int {
        return favoriteUsers.count
    }
    
    func getFavoriteUser(at index: Int) -> User {
        return favoriteUsers[index]
    }
    
    func getUser(at index: Int) -> User {
        return allUsers[index]
    }
    
    func replaceUsers(with newUsers: [User]) {
        allUsers = newUsers
    }
    
    // MARK: - Persisting Data
    
    func saveToTheDeviceStorage() {
        do {
            try UserDefaults.standard.set(PropertyListEncoder().encode(allUsers), forKey: usersKey)
        } catch {
            print("Saving failed...")
        }
    }
    
    func loadFromTheDeviceStorage() {
        guard let usersData = UserDefaults.standard.object(forKey: usersKey) as? Data else { return }
        
        do {
            let loadedUsers = try PropertyListDecoder().decode([User].self, from: usersData)
            
            replaceUsers(with: loadedUsers)
        } catch {
            print("Loading failed...")
        }
    }
    
}
