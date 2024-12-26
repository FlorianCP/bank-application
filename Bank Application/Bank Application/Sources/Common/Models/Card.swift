import Foundation

struct Card: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let description: String
    let smallText: String
    let identifier: String
    let imageName: String?
    
    init(title: String, subtitle: String, description: String, smallText: String, identifier: String, imageName: String? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.smallText = smallText
        self.identifier = identifier
        self.imageName = imageName
    }
} 