import SwiftUI

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    @State private var currentPage = 0
    
    // Sample news data
    let newsItems = [
        News(
            title: "Neue Funktion für Mobilen Zahlung",
            description: "Übertragen Sie Geld sofort an Ihre Freunde und Familie",
            imageUrl: "payment_feature"
        ),
        News(
            title: "Sicherheit Update",
            description: "Wir haben unsere Sicherheitsmaßnahmen verbessert, um Ihr Konto zu schützen",
            imageUrl: "security_update"
        ),
        News(
            title: "Investment Opportunities",
            description: "Entdecken Sie neue Möglichkeiten, Ihr Vermögen zu vergrößern mit unseren Investment-Optionen",
            imageUrl: "investment"
        )
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                
                // News ScrollView with paging
                TabView(selection: $currentPage) {
                    ForEach(Array(newsItems.enumerated()), id: \.element.id) { index, news in
                        NewsView(news: news)
                            .tag(index)
                    }
                }
                .frame(height: 140)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Custom page indicator
                HStack {
                    Spacer()
                    ForEach(0..<newsItems.count, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color.ciYellowDarker : Color.gray.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                    Spacer()
                }
                .padding(.top, -8)
                
                Text("Willkommen in Ihrer Übersicht")
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    isLoggedIn = false
                }) {
                    Text("AUSLOGGEN")
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
            .navigationTitle("Übersicht")
        }
    }
}

#Preview {
    OverviewView(isLoggedIn: .constant(true))
}
