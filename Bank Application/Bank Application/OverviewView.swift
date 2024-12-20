import SwiftUI

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Overview")
                    .font(.largeTitle)
                    .padding()
                
                Text("Welcome to your application overview")
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button(action: {
                    isLoggedIn = false
                }) {
                    Text("LOGOUT")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    OverviewView(isLoggedIn: .constant(true))
} 