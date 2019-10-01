import SwiftUI

struct ListView: View {
    
    let usersStorage: UsersStorage
    
    var body: some View {
        NavigationView {
            List(usersStorage.allUsers) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    ListRow(title: user.firstName, subtitle: user.lastName)
                }
            }
            .navigationBarTitle("Users")
            .navigationBarItems(trailing:
                Button(action: {
                    UserStorageRefreshService(usersStorage: self.usersStorage).refreshUsers()
                }, label: {
                    Image(systemName: "arrow.clockwise")
                })
            )
        }
    }
    
}

final class UserStorageRefreshService {
    
    let usersStorage: UsersStorage
    let apiService: APIService
    
    init(usersStorage: UsersStorage) {
        self.usersStorage = usersStorage
        self.apiService = APIService()
    }
    
    func refreshUsers() {
        APIService().request(.results(Configuration.resultsCount, apiVersion: Configuration.apiVersion)) { response, error in
        }
    }
    
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView(usersStorage: UsersStorage())
    }
    
}
#endif
