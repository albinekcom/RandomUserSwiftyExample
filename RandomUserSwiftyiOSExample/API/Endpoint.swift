import Foundation

struct Endpoint {
    
    let apiVersion: Double
    
    let queryItems: [URLQueryItem]
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "randomuser.me"
        urlComponents.path = "/api/\(apiVersion)/"
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
    
}

extension Endpoint {
    
    static func results(_ results: Int, apiVersion: Double) -> Endpoint {
        return Endpoint(
            apiVersion: apiVersion,
            queryItems:
            [
                URLQueryItem(name: "results", value: String(results)),
                URLQueryItem(name: "exc", value: "location") // It is due to: https://github.com/RandomAPI/Randomuser.me-Node/issues/113
            ]
        )
    }
    
}
