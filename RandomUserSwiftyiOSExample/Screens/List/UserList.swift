import SwiftUI
import Combine

struct UserList: View {
    
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show favorites only")
                }

                ForEach(userData.allUsers) { user in
                    if self.userData.showFavoritesOnly == false || user.isFavorite {
                        NavigationLink(destination: UserDetail(user: user).environmentObject(self.userData)) {
                            UserListRow(title: user.firstName, subtitle: user.lastName, isFavorite: user.isFavorite)
                        }
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Users")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    UserListRefreshService(userData: self.userData).refreshUsers()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
            )
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        userData.allUsers.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        userData.allUsers.remove(atOffsets: offsets)
    }
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        UserList().environmentObject(UserData())
    }
    
}
#endif
