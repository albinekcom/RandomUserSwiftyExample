import Foundation

struct APIResponseParser {
    
    func parseResponse(data: Data) throws -> APIResponse {
        return try JSONDecoder().decode(APIResponse.self, from: data)
    }

}
