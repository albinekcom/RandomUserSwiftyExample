import Foundation

struct APIResponseParser {
    
    func parseResponse(data: Data) throws -> Users {
        return try JSONDecoder().decode(Users.self, from: data)
    }

}
