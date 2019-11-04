
struct UserDetailViewModel {
    
    let user: User
    
    var firstName: String {
        return user.firstName ?? ""
    }
    
    var lastName: String {
        return user.lastName ?? ""
    }
    
    var gender: String {
        return user.gender ?? ""
    }
    
    var email: String {
        return user.email ?? ""
    }
    
    var phone: String {
        return user.phone ?? ""
    }
    
    var cell: String {
        return user.cell ?? ""
    }
    
}
