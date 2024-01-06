import SwiftUI

struct GuideComponent: View {
    
    // MARK: – PROPERTIES
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    // MARK: – BODY
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title.uppercased())
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                }
                Divider().padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

// MARK: – PREVIEW
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title",
                       subtitle: "Swipe right",
                       description: "This is a placeholder sentence. this is a placeholder senttence. this is a placeholder sentance.",
                       icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
