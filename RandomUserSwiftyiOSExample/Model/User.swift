import Foundation

final class User {
    
    let gender: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let cell: String?
    let picture: Picture?
    
    private(set) var isFavorite: Bool
    
    init(gender: String?, firstName: String?, lastName: String?, email: String?, phone: String?, cell: String?, picture: Picture?, isFavorite: Bool) {
        self.gender = gender
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.cell = cell
        self.picture = picture
        self.isFavorite = isFavorite
    }
    
    func toggleFavorite() {
        self.isFavorite = !isFavorite
    }
    
}
