import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 12) {
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(card.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(card.description)
                    .font(.body)
                    .foregroundColor(.primary)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                
                Spacer(minLength: 8)
                
                Text(card.smallText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
                .font(.system(size: 14, weight: .semibold))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CardView(card: Card(
        title: "Example Title",
        subtitle: "Example Subtitle",
        description: "This is a longer description that can span multiple lines and provide more detailed information about the card content.",
        smallText: "Additional information"
    ))
    .padding()
    .background(Color.gray.opacity(0.1))
} 