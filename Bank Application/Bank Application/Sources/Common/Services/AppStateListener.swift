//
//  AppStateListener.swift
//  Bank Application
//
//  Created by Florian Rath on 30.12.24.
//

import Combine

@MainActor
final class AppStateListener: Sendable {
    
    // MARK: - Singleton
    
    static let shared = AppStateListener()
    
    private init() {}
    
    // MARK: - Properties
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    
    func startListening() {
        AppStore.shared.isLoggedInPublisher
            .dropFirst()
            .sink { isLoggedIn in
                // Send analytics event
                print("isLoggedIn: \(isLoggedIn)")
            }
            .store(in: &cancellables)
    }
}
