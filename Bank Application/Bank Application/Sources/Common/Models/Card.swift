import Foundation

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let accountHolder: String
    let iban: String
    let balance: Double
    let availableBalance: Double
    
    var formattedBalance: String {
        String(format: "%.2f EUR", balance)
    }
    
    var formattedAvailableBalance: String {
        String(format: "%.2f EUR", availableBalance)
    }
} 