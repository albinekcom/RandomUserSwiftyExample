import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var userData: UserData
    
    var user: User
    
    var userIndex: Int {
        userData.allUsers.firstIndex(where: { $0.id == user.id })!
    }
    
    var body: some View {
        let detailViewModel = DetailViewModel(user: user)
        
        return List {
            Button(action: {
                self.userData.allUsers[self.userIndex].isFavorite.toggle()
            }, label: {
                if self.userData.allUsers[self.userIndex].isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.gray)
                }
            })
            DetailRow(title: detailViewModel.firstName, subtitle: "First name")
            DetailRow(title: detailViewModel.lastName, subtitle: "Last name")
            DetailRow(title: detailViewModel.gender, subtitle: "Gender")
            DetailRow(title: detailViewModel.email, subtitle: "E-mail")
            DetailRow(title: detailViewModel.phone, subtitle: "Phone")
            DetailRow(title: detailViewModel.cell, subtitle: "Cell")
        }
        .navigationBarTitle("Detail")
    }
    
}

#if DEBUG
struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let user = User(firstName: "a", lastName: "b", gender: "c", email: "d", phone: "e", cell: "f")
        
        return DetailView(user: user).environmentObject(UserData())
    }
    
}
#endif
