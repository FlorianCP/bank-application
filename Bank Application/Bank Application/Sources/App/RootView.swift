import SwiftUI

struct RootView: View {
    @StateObject private var store = AppStore.shared
    
    var body: some View {
        Group {
            if store.isLoggedIn {
                OverviewView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
} 
