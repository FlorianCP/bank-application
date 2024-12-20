import Foundation

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let description: String
    let smallText: String
} 