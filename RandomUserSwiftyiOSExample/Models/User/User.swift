import Foundation

final class User: Codable, Equatable, Identifiable {
    
    static func == (lhs: User, rhs: User) -> Bool {
        return
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.gender == rhs.gender &&
            lhs.email == rhs.email &&
            lhs.email == rhs.email &&
            lhs.cell == rhs.cell
    }
    
    let firstName: String?
    let lastName: String?
    let gender: String?
    let email: String?
    let phone: String?
    let cell: String?
    
    let id: String
    
    var isFavorite: Bool = false
    
    init(firstName: String?, lastName: String?, gender: String?, email: String?, phone: String?, cell: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.email = email
        self.phone = phone
        self.cell = cell
        
        if let email = email {
            self.id = email
        } else {
            self.id = UUID().uuidString
        }
    }
}
