import Foundation

struct APIService {
    
    func request(_ endpoint: Endpoint, completion: @escaping (_ response: APIResponse?, _ error: Error?) -> Void) {
        guard let url = endpoint.url else { return }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil, let data = data else {
                completion(nil, error)
                return
            }

            let response = try? APIResponseParser().parseResponse(data: data)
            completion(response, nil)
        }

        task.resume()
    }
    
}
