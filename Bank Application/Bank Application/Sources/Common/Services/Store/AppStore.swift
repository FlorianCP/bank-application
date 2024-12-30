import Combine
import Foundation

// MARK: - DetailScreen Enum

enum DetailScreen: Equatable {
    case none
    case personalDetails
    case expertise
    case projects
    case skills
    case values
}

// MARK: - State

struct AppState: Equatable, Sendable {
    var currentDetailScreen: DetailScreen = .none
    var isLoggedIn: Bool = false
}

@MainActor
final class AppStore: ObservableObject, Sendable {
    
    // MARK: - Singleton
    
    static let shared = AppStore()
    
    private init() {}
    
    // MARK: - Published State
    
    @Published private(set) var state: AppState = AppState()
    
    // MARK: - Actions
    
    enum Action: Sendable {
        case setDetailScreen(DetailScreen)
        case setLoggedIn(Bool)
    }
    
    // MARK: - Reducer
    
    private func reduce(_ action: Action) -> AppState {
        var newState = state

        switch action {
        case .setDetailScreen(let screen):
            newState.currentDetailScreen = screen
        case .setLoggedIn(let isLoggedIn):
            newState.isLoggedIn = isLoggedIn
        }
        
        return newState
    }
    
    // MARK: - Action Handler

    func dispatch(_ action: Action) {
        state = reduce(action)
    }
}

// MARK: - Scoped Publishers

extension AppStore {
    var isLoggedInPublisher: AnyPublisher<Bool, Never> {
        $state
            .map(\.isLoggedIn)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
}
