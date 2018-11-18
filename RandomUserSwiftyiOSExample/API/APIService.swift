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
    
    // MARK: Mocked request
    func request(_ endpoint: Endpoint, completion: @escaping (_ response: APIResponse?, _ error: Error?) -> Void) {
        let jsonString = """
        {
            "results": [{
                "gender": "male",
                "name": {
                    "title": "mr",
                    "first": "sebastian",
                    "last": "jørgensen"
                },
                "email": "sebastian.jørgensen@example.com",
                "login": {
                    "uuid": "d587dc9e-d21a-4f19-99e3-9686d0586e00",
                    "username": "tinydog620",
                    "password": "maxima",
                    "salt": "3jhO7eJ2",
                    "md5": "c2d253f1f5f12d58874eec6e79ce0c69",
                    "sha1": "4ea3114c3ff004ffb7ba796eb355fdfec4d8f53f",
                    "sha256": "8a6aeecf71c5162e7eb924f402b41176c1406824bd4fa99747df7e21b19d341a"
                },
                "dob": {
                    "date": "1965-09-15T15:28:08Z",
                    "age": 53
                },
                "registered": {
                    "date": "2011-04-06T14:34:28Z",
                    "age": 7
                },
                "phone": "80353800",
                "cell": "91977754",
                "id": {
                    "name": "CPR",
                    "value": "111002-7202"
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/men/38.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/men/38.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/men/38.jpg"
                },
                "nat": "DK"
            }, {
                "gender": "female",
                "name": {
                    "title": "miss",
                    "first": "sélène",
                    "last": "roy"
                },
                "email": "sélène.roy@example.com",
                "login": {
                    "uuid": "fcbb8622-1004-4b40-b8af-f2254bd10652",
                    "username": "angrybird598",
                    "password": "a123456",
                    "salt": "ayviWK4A",
                    "md5": "8d94559d06652bd8b7859c9eb955b6c0",
                    "sha1": "74c57bbc045116db80388ee0b0313ac6cf8667fe",
                    "sha256": "0f2961883720978fd9b5fe963de014aaec57696df04089d7d4b0ba40bd00bdac"
                },
                "dob": {
                    "date": "1990-03-15T16:07:14Z",
                    "age": 28
                },
                "registered": {
                    "date": "2008-08-14T07:38:47Z",
                    "age": 10
                },
                "phone": "01-34-80-35-48",
                "cell": "06-80-11-30-94",
                "id": {
                    "name": "INSEE",
                    "value": "2NNaN62373427 36"
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/women/34.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/women/34.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/34.jpg"
                },
                "nat": "FR"
            }, {
                "gender": "female",
                "name": {
                    "title": "mrs",
                    "first": "kübra",
                    "last": "sezek"
                },
                "email": "kübra.sezek@example.com",
                "login": {
                    "uuid": "e60008d6-5257-4d05-97ed-11150f6a35c5",
                    "username": "purplebutterfly391",
                    "password": "superfly",
                    "salt": "iesY7wUA",
                    "md5": "696c5665b149e6fb2d1abc0dae8e2c70",
                    "sha1": "c1acdffc83cac9cd3dab43fc031f375e1bbff536",
                    "sha256": "fb8ed703cbda4c18dbb26999643f91fad1302ced008743a6a0ee8d3a031a4aef"
                },
                "dob": {
                    "date": "1957-04-25T07:55:40Z",
                    "age": 61
                },
                "registered": {
                    "date": "2013-08-01T14:33:39Z",
                    "age": 5
                },
                "phone": "(775)-368-6708",
                "cell": "(308)-707-0986",
                "id": {
                    "name": "",
                    "value": null
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/women/15.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/women/15.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/15.jpg"
                },
                "nat": "TR"
            }, {
                "gender": "female",
                "name": {
                    "title": "ms",
                    "first": "pinja",
                    "last": "heino"
                },
                "email": "pinja.heino@example.com",
                "login": {
                    "uuid": "c5cec8b5-1c38-40a2-94df-5b6da153b2cc",
                    "username": "blackleopard148",
                    "password": "blanca",
                    "salt": "364zS0CM",
                    "md5": "abc72142ea757795b970f2fb7cb1d51b",
                    "sha1": "d7d7e0361bed8247dc6f74a97a88b65a5cdecd3c",
                    "sha256": "6b4efbaba9e104457162df1e74f67878e5bc624326c05da9a725b21b9a8222a5"
                },
                "dob": {
                    "date": "1977-01-07T04:36:24Z",
                    "age": 41
                },
                "registered": {
                    "date": "2014-09-22T19:14:52Z",
                    "age": 4
                },
                "phone": "06-685-811",
                "cell": "040-422-39-03",
                "id": {
                    "name": "HETU",
                    "value": "NaNNA684undefined"
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/women/27.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/women/27.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/27.jpg"
                },
                "nat": "FI"
            }, {
                "gender": "female",
                "name": {
                    "title": "ms",
                    "first": "silje",
                    "last": "rasmussen"
                },
                "email": "silje.rasmussen@example.com",
                "login": {
                    "uuid": "aeab0d51-db1c-41fd-96dc-2d33f9a0dee6",
                    "username": "organickoala293",
                    "password": "johnson1",
                    "salt": "QeDBYEuD",
                    "md5": "2c0ff54decc29ec8e7844895b3a9f5ad",
                    "sha1": "c4994c688f7d7b75682ba8f73ebd87502d9243c8",
                    "sha256": "d001fa41e4ed68045ebe5defce888470f317c23d7581ab82b2fb61b01dd66633"
                },
                "dob": {
                    "date": "1955-12-20T12:00:09Z",
                    "age": 62
                },
                "registered": {
                    "date": "2007-03-22T01:01:33Z",
                    "age": 11
                },
                "phone": "97584062",
                "cell": "28108516",
                "id": {
                    "name": "CPR",
                    "value": "508071-4346"
                },
                "picture": {
                    "large": "https://randomuser.me/api/portraits/women/12.jpg",
                    "medium": "https://randomuser.me/api/portraits/med/women/12.jpg",
                    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/12.jpg"
                },
                "nat": "DK"
            }],
            "info": {
                "seed": "27294dde1e946c9c",
                "results": 5,
                "page": 1,
                "version": "1.2"
            }
        }
        """
        
        let jsonData = jsonString.data(using: .utf8)!
        
        let response = try? APIResponseParser().parseResponse(data: jsonData)
        
        completion(response, nil)
    }
    
}
