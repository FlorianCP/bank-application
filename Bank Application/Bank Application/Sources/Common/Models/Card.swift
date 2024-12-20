import Foundation

struct Card: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let description: String
    let smallText: String
    let identifier: String
} 