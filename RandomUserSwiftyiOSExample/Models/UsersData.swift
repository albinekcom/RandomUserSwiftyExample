
import Combine
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
        guard let usersData = UserDefaults.standard.object(forKey: usersKey) as? Data else { return }
        
        do {
            let loadedUsers = try PropertyListDecoder().decode([User].self, from: usersData)
            
            DispatchQueue.main.async { [weak self] in
                self?.allUsers = loadedUsers
            }
        } catch {
            print("Loading failed...")
        }
    }
}
