import SwiftUI

struct DetailView: View {
    
    let user: User
    
    var body: some View {
        let detailViewModel = DetailViewModel(user: user)
        
        return List {
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
        let user = User(firstName: "firstName", lastName: "lastName", gender: "gender", email: "email@email.com", phone: "123456789", cell: "123456789")
        
        return DetailView(user: user)
    }
    
}
#endif
