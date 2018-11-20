import Foundation

final class UsersStorage {
    
    private let usersKey = "users"
    
    private(set) var allUsers = [User]()
    
    func replaceUsers(with newUsers: [User]) {
        allUsers = newUsers
    }
    
    func removeUser(at index: Int) {
        allUsers.remove(at: index)
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
