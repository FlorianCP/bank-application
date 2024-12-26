import SwiftUI

struct CustomCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // .opacity(configuration.isPressed ? 0.8 : 1.0)
            .shadow(
                color: Color.black.opacity(configuration.isPressed ? 0.3 : 0.1),
                radius: configuration.isPressed ? 8 : 5,
                x: 0,
                y: configuration.isPressed ? 4 : 2
            )
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
}

struct CardView: View {
    let card: Card
    var action: (String) -> Void = { _ in}
    
    var body: some View {
        Button(action: { action(card.identifier) }) {
            HStack(alignment: .center, spacing: 16) {
                if let imageName = card.imageName {
                    Image(systemName: imageName)
                        .font(.system(size: 24))
                        .foregroundColor(.accentColor)
                        .frame(width: 32, height: 32)
                }
                
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
                        .multilineTextAlignment(.leading)
                    
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
        }
        .buttonStyle(CustomCardButtonStyle())
    }
}

#Preview {
    CardView(card: Card(
        title: "Example Title",
        subtitle: "Example Subtitle",
        description: "This is a longer description that can span multiple lines and provide more detailed information about the card content.",
        smallText: "Additional information",
        identifier: "example",
        imageName: "star.fill"
    ))
    .padding()
    .background(Color.gray.opacity(0.1))
} 
