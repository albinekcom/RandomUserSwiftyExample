import Foundation

public struct APIResponse: Codable {
    
    let results: [APIResponseResult]?
    let info: APIResponseInfo?
    
}

struct APIResponseInfo: Codable {
    
    let seed: String?
    let results, page: Int?
    let version: String?
    
}

struct APIResponseResult: Codable {
    
    let gender: String?
    let name: APIResponseName?
    let location: APIResponseLocation?
    let email: String?
    let login: APIResponseLogin?
    let dob: APIResponseDob?
    let registered: APIResponseDob?
    let phone, cell: String?
    let id: APIResponseID?
    let picture: APIResponsePicture?
    let nat: String?
    
}

struct APIResponseDob: Codable {
    
    let date: String?
    let age: Int?
    
}

struct APIResponseID: Codable {
    
    let name: String?
    let value: String?
    
}

struct APIResponseLocation: Codable {
    
    let street: String?
    let city: String?
    let state: String?
    let postcode: Int?
    let coordinates: APIResponseCoordinates?
    let timezone: APIResponseTimezone?
    
}

struct APIResponseCoordinates: Codable {
    
    let latitude: String?
    let longitude: String?
    
}

struct APIResponseTimezone: Codable {
    
    let offset: String?
    let description: String?
    
}

struct APIResponseLogin: Codable {
    
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
    
}

struct APIResponseName: Codable {
    
    let title: String?
    let first: String?
    let last: String?
    
}

struct APIResponsePicture: Codable {
    
    let large: String?
    let medium: String?
    let thumbnail: String?
    
}
