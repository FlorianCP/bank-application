import Combine
import Foundation

enum DetailScreen: Equatable {
    case none
    case personalDetails
    case expertise
    case projects
    case skills
}

final class AppStore: ObservableObject {
    // MARK: - Published State
    @Published private(set) var currentDetailScreen: DetailScreen = .none
    @Published private(set) var isLoggedIn: Bool = false
    
    // MARK: - Actions
    enum Action {
        case setDetailScreen(DetailScreen)
        case setLoggedIn(Bool)
    }
    
    // MARK: - Action Handler
    func dispatch(_ action: Action) {
        print("Dispatched action: \(action)")
        switch action {
        case .setDetailScreen(let screen):
            currentDetailScreen = screen
        case .setLoggedIn(let isLoggedIn):
            self.isLoggedIn = isLoggedIn
        }
    }
}

// MARK: - Singleton Instance
extension AppStore {
    static let shared = AppStore()
} 
