import Foundation

final class User {
    
    let firstName: String?
    let lastName: String?
    let gender: String?
    let email: String?
    let phone: String?
    let cell: String?
    let picture: Picture?
    
    private(set) var isFavorite: Bool
    
    init(firstName: String?, lastName: String?, gender: String?, email: String?, phone: String?, cell: String?, picture: Picture?, isFavorite: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
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
