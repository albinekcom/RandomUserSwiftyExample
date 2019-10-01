import SwiftUI

struct ListRow: View {
    
    let title: String?
    let subtitle: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title ?? "-")
                .font(.subheadline)
            Text(subtitle ?? "-")
                .font(.subheadline)
        }
    }
    
}

struct ListRow_Previews: PreviewProvider {
    
    static var previews: some View {
        ListRow(title: "Title", subtitle: "Subtitle")
    }
    
}
