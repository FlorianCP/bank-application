import SwiftUI

struct RootView: View {
    @StateObject private var store = AppStore.shared
    
    var body: some View {
        Group {
            if store.state.isLoggedIn {
                OverviewView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            AppStateListener.shared.startListening()
        }
    }
}

#Preview {
    RootView()
} 
