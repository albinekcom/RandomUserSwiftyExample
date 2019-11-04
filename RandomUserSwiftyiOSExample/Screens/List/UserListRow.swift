import SwiftUI

struct UserListRow: View {
    
    let title: String?
    let subtitle: String?
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title ?? "-")
                    .font(.subheadline)
                Text(subtitle ?? "-")
                    .font(.subheadline)
            }
            
            Spacer()
            
            if isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
    
}

struct ListRow_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            UserListRow(title: "Title", subtitle: "Subtitle without star", isFavorite: false)
            UserListRow(title: "Title", subtitle: "Subtitle with star", isFavorite: true)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
