import Foundation

public struct Users: Codable {
    let results: [Result]?
    let info: Info?
}

struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}

struct Result: Codable {
    let gender: Gender?
    let name: NameClass?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?
    
    private(set) var isFavorite: Bool? = nil
    
    mutating func toggleFavorite() {
        guard let oldIsFavorite = isFavorite else { return }
        
        self.isFavorite = !oldIsFavorite
    }
}

struct Dob: Codable {
    let date: String?
    let age: Int?
}

enum Gender: String, Codable {
    case female
    case male
}

struct ID: Codable {
    let name: String?
    let value: String?
}

struct Location: Codable {
    let street, city, state: String?
    let postcode: String?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

struct Coordinates: Codable {
    let latitude, longitude: String?
}

struct Timezone: Codable {
    let offset, description: String?
}

struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

struct NameClass: Codable {
    let title: String?
    let first, last: String?
}

struct Picture: Codable {
    let large, medium, thumbnail: String?
}
