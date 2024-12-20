import SwiftUI

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    
    // Sample news data
    let newsItems = [
        News(
            title: "New Mobile Payment Feature",
            description: "Transfer money instantly to your friends and family",
            imageUrl: "payment_feature"
        ),
        News(
            title: "Security Update",
            description: "We've enhanced our security measures to protect your account",
            imageUrl: "security_update"
        ),
        News(
            title: "Investment Opportunities",
            description: "Discover new ways to grow your wealth with our investment options",
            imageUrl: "investment"
        )
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Overview")
                    .font(.largeTitle)
                    .padding(.horizontal)
                
                // News ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(newsItems) { news in
                            NewsView(news: news)
                        }
                    }
                    .padding(.horizontal)
                    .padding([.top, .bottom], 8)
                }
                
                Text("Welcome to your application overview")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
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
