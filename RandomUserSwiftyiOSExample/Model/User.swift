import Foundation

struct User {
    
    let gender: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let cell: String?
    let picture: Picture?
    
    private(set) var isFavorite: Bool
    
    mutating func toggleFavorite() {
        self.isFavorite = !isFavorite
    }
    
}
