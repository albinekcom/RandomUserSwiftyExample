import Foundation

struct APIService {
    
//    func request(_ endpoint: Endpoint, completion: @escaping (_ users: Users?, _ error: Error?) -> Void) {
//        guard let url = endpoint.url else { return }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
//            guard error == nil, let data = data else {
//                completion(nil, error)
//                return
//            }
//
//            let users = try? APIResponseParser().parseResponse(data: data)
//            completion(users, nil)
//        }
//
//        task.resume()
//    }
    
    // MARK: Mocked request results for
    func request(_ endpoint: Endpoint, completion: @escaping (_ users: Users?, _ error: Error?) -> Void) {
        let jsonString =
        """
        {
            "results": [{
                "gender": "male",
                "name": {
                    "title": "mr",
                    "first": "philippe",
                    "last": "addy"
                },
                "location": {
                    "street": "2185 grand marais ave",
                    "city": "alma",
                    "state": "saskatchewan",
                    "postcode": "H8N 7G7",
                    "coordinates": {
                        "latitude": "-58.8468",
                        "longitude": "-122.3733"
                    },
                    "timezone": {
                        "offset": "+9:30",
                        "description": "Adelaide, Darwin"
                    }
                },
                "email": "philippe.addy@example.com",
                "login": {
                    "uuid": "c0e380d8-cc62-43e8-8661-c91eacc90583",
                    "username": "happycat828",
                    "password": "gorilla",
                    "salt": "WXzil4GH",
                    "md5": "6a402b73cfb2fb9155426296372c9844",
                    "sha1": "3eed37b7551e8bbabdb8cb6edbbf478d52c85dc7",
                    "sha256": "020721f7a770f69142157f6d6f96986131e70687876902cafe91365f05b21a5f"
                    },
                "dob": {
                    "date": "1976-05-14T18:01:48Z",
                    "age": 42
                },
                "registered": {
                    "date": "2003-04-17T16:18:13Z",
                    "age": 15
                },
                "phone": "677-503-5218",
                "cell": "058-147-4042",
                "id": {
                    "name": "",
                    "value": null
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/men/91.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/men/91.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/91.jpg"
                },
                "nat": "CA"
            }],
                "info": {
                    "seed": "4f99195e5dd3a91f",
                    "results": 1,
                    "page": 1,
                    "version": "1.2"
                }
            }
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        let users = try? APIResponseParser().parseResponse(data: jsonData)
        completion(users, nil)
    }
    
}
