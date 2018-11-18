import Foundation

struct UserFactory {
    
    static func makeUser(from results: [APIResponseResult]) -> [User] {
        var users = [User]()
        
        for result in results {
            let user = makeUser(from: result)
            users.append(user)
        }
        
        return users
    }
    
    static func makeUser(from result: APIResponseResult) -> User {
        let user = User(
            gender: result.gender,
            firstName: result.name?.first,
            lastName: result.name?.last,
            email: result.email,
            phone: result.phone,
            cell: result.cell,
            picture: PictureFactory.makePicture(from: result.picture),
            isFavorite: false
        )
        
        return user
    }

}
