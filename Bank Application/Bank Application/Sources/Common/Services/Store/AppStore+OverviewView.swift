//
//  AppStore+OverviewView.swift
//  Bank Application
//
//  Created by Florian Rath on 30.12.24.
//

import SwiftUI

extension AppStore {
    
    enum Overview {
        
        @MainActor
        static var isShowingPersonalDetails: Binding<Bool> {
            Binding(
                get: { AppStore.shared.state.currentDetailScreen == .personalDetails },
                set: {
                    if $0 && AppStore.shared.state.currentDetailScreen != .personalDetails {
                        AppStore.shared.dispatch(.setDetailScreen(.personalDetails))
                    }
                    if !$0 && AppStore.shared.state.currentDetailScreen == .personalDetails {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        @MainActor
        static var isShowingExpertise: Binding<Bool> {
            Binding(
                get: { AppStore.shared.state.currentDetailScreen == .expertise },
                set: {
                    if $0 && AppStore.shared.state.currentDetailScreen != .expertise {
                        AppStore.shared.dispatch(.setDetailScreen(.expertise))
                    }
                    if !$0 && AppStore.shared.state.currentDetailScreen == .expertise {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        @MainActor
        static var isShowingProjects: Binding<Bool> {
            Binding(
                get: { AppStore.shared.state.currentDetailScreen == .projects },
                set: {
                    if $0 && AppStore.shared.state.currentDetailScreen != .projects {
                        AppStore.shared.dispatch(.setDetailScreen(.projects))
                    }
                    if !$0 && AppStore.shared.state.currentDetailScreen == .projects {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        @MainActor
        static var isShowingSkills: Binding<Bool> {
            Binding(
                get: { AppStore.shared.state.currentDetailScreen == .skills },
                set: {
                    if $0 && AppStore.shared.state.currentDetailScreen != .skills {
                        AppStore.shared.dispatch(.setDetailScreen(.skills))
                    }
                    if !$0 && AppStore.shared.state.currentDetailScreen == .skills {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        @MainActor
        static var isShowingValues: Binding<Bool> {
            Binding(
                get: { AppStore.shared.state.currentDetailScreen == .values },
                set: {
                    if $0 && AppStore.shared.state.currentDetailScreen != .values {
                        AppStore.shared.dispatch(.setDetailScreen(.values))
                    }
                    if !$0 && AppStore.shared.state.currentDetailScreen == .values {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
    }
}
