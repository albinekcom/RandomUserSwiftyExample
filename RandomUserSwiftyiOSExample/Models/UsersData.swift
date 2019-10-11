import SwiftUI

final class UserData: ObservableObject {
    
    @Published var showFavoritesOnly: Bool = false
    @Published var allUsers: [User] = [User]()
    
    // MARK: - Private
    
    private let usersKey: String = "users"
    
    // MARK: - Persisting Data
    
    func saveToTheDeviceStorage() {
        do {
            try UserDefaults.standard.set(PropertyListEncoder().encode(allUsers), forKey: usersKey)
        } catch {
            print("Saving failed...")
        }
    }
    
    func loadFromTheDeviceStorage() {
        let user1 = User(firstName: "firstName 1", lastName: "lastName 1", gender: "gender", email: "email1@email.com", phone: "123456789", cell: "123456789")
        let user2 = User(firstName: "firstName 2", lastName: "lastName 2", gender: "gender", email: "email2@email.com", phone: "123456789", cell: "123456789")
        let user3 = User(firstName: "firstName 3", lastName: "lastName 3", gender: "gender", email: "email3@email.com", phone: "123456789", cell: "123456789")
        let user4 = User(firstName: "firstName 4", lastName: "lastName 4", gender: "gender", email: "email4@email.com", phone: "123456789", cell: "123456789")
        
        let users = [user1, user2, user3, user4]
        
        DispatchQueue.main.async { [weak self] in
            self?.allUsers = users
        }
    }
    
}
