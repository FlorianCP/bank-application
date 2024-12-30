//
//  AppStore+OverviewView.swift
//  Bank Application
//
//  Created by Florian Rath on 30.12.24.
//

import SwiftUI

extension AppStore {
    
    enum Overview {
        
        static var isShowingPersonalDetails: Binding<Bool> {
            Binding(
                get: { AppStore.shared.currentDetailScreen == .personalDetails },
                set: {
                    if $0 && AppStore.shared.currentDetailScreen != .personalDetails {
                        AppStore.shared.dispatch(.setDetailScreen(.personalDetails))
                    }
                    if !$0 && AppStore.shared.currentDetailScreen == .personalDetails {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        static var isShowingExpertise: Binding<Bool> {
            Binding(
                get: { AppStore.shared.currentDetailScreen == .expertise },
                set: {
                    if $0 && AppStore.shared.currentDetailScreen != .expertise {
                        AppStore.shared.dispatch(.setDetailScreen(.expertise))
                    }
                    if !$0 && AppStore.shared.currentDetailScreen == .expertise {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        static var isShowingProjects: Binding<Bool> {
            Binding(
                get: { AppStore.shared.currentDetailScreen == .projects },
                set: {
                    if $0 && AppStore.shared.currentDetailScreen != .projects {
                        AppStore.shared.dispatch(.setDetailScreen(.projects))
                    }
                    if !$0 && AppStore.shared.currentDetailScreen == .projects {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        static var isShowingSkills: Binding<Bool> {
            Binding(
                get: { AppStore.shared.currentDetailScreen == .skills },
                set: {
                    if $0 && AppStore.shared.currentDetailScreen != .skills {
                        AppStore.shared.dispatch(.setDetailScreen(.skills))
                    }
                    if !$0 && AppStore.shared.currentDetailScreen == .skills {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
        
        static var isShowingValues: Binding<Bool> {
            Binding(
                get: { AppStore.shared.currentDetailScreen == .values },
                set: {
                    if $0 && AppStore.shared.currentDetailScreen != .values {
                        AppStore.shared.dispatch(.setDetailScreen(.values))
                    }
                    if !$0 && AppStore.shared.currentDetailScreen == .values {
                        AppStore.shared.dispatch(.setDetailScreen(.none))
                    }
                }
            )
        }
    }
}
