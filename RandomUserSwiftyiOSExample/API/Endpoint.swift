import Foundation

struct Endpoint {
    let queryItems: [URLQueryItem]
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "randomuser.me"
        urlComponents.path = "/api/"
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
}

extension Endpoint {
    
    static func results(_ results: Int) -> Endpoint {
        return Endpoint(queryItems: [URLQueryItem(name: "results", value: String(results))])
    }
    
}
