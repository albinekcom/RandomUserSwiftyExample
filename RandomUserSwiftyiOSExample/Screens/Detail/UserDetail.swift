import SwiftUI

struct UserDetail: View {
    
    @EnvironmentObject var userData: UserData
    
    var user: User
    
    var userIndex: Int? {
        userData.allUsers.firstIndex(where: { $0.id == user.id })
    }
    
    private var isFavorite: Bool {
        if let userIndex = userData.allUsers.firstIndex(where: { $0.id == user.id }), userData.allUsers[userIndex].isFavorite == true {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        let detailViewModel = UserDetailViewModel(user: user)
        
        return List {
            UserDetailRow(title: detailViewModel.firstName, subtitle: "First name")
            UserDetailRow(title: detailViewModel.lastName, subtitle: "Last name")
            UserDetailRow(title: detailViewModel.gender, subtitle: "Gender")
            UserDetailRow(title: detailViewModel.email, subtitle: "E-mail")
            UserDetailRow(title: detailViewModel.phone, subtitle: "Phone")
            UserDetailRow(title: detailViewModel.cell, subtitle: "Cell")
        }
        .navigationBarTitle("Detail")
        .navigationBarItems(trailing:
            Button(action: {
                if let userIndex = self.userIndex {
                    self.userData.allUsers[userIndex].isFavorite.toggle()
                }
            }, label: {
                self.isFavorite ? AnyView(TurnedOnStarView()) : AnyView(TurnedOffStarView())
            })
        )
    }
    
}

struct TurnedOnStarView: View {
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
    }
    
}

struct TurnedOffStarView: View {
    
    var body: some View {
        Image(systemName: "star")
            .foregroundColor(.gray)
    }
    
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let userData = UserData()
        
        return UserDetail(user: userData.allUsers[0]).environmentObject(userData)
    }
    
}
#endif
