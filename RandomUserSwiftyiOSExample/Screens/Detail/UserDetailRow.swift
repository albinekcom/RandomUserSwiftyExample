import SwiftUI

struct UserDetailRow: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
            Text(subtitle)
                .font(.subheadline)
        }
    }
    
}

struct DetailRow_Previews: PreviewProvider {
    
    static var previews: some View {
        UserDetailRow(title: "Title", subtitle: "Subtitle")
    }
    
}
