import SwiftUI

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    @State private var currentPage = 0
    
    // Sample cards data
    let cards = [
        Card(
            title: "GIRO",
            accountHolder: "Flo Privat",
            iban: "AT59 3400 0000 0133 6254",
            balance: 1728.97,
            availableBalance: 1928.97
        ),
        Card(
            title: "SPARKONTO",
            accountHolder: "Flo Sparen",
            iban: "AT59 3400 0000 0133 6255",
            balance: 15482.50,
            availableBalance: 15482.50
        ),
        Card(
            title: "KREDITKARTE",
            accountHolder: "Flo Kredit",
            iban: "AT59 3400 0000 0133 6256",
            balance: -523.42,
            availableBalance: 4476.58
        ),
        Card(
            title: "INVESTMENT",
            accountHolder: "Flo Invest",
            iban: "AT59 3400 0000 0133 6257",
            balance: 8234.91,
            availableBalance: 8234.91
        ),
        Card(
            title: "FAMILIENKONTO",
            accountHolder: "Familie Privat",
            iban: "AT59 3400 0000 0133 6258",
            balance: 3567.82,
            availableBalance: 3567.82
        )
    ]
    
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
            ZStack {
                // Background Image
                Image("login_background")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 20)
                    .opacity(0.25)
                    .ignoresSafeArea()
                    .frame(width: UIScreen.main.bounds.width)
                
                // Content
                ScrollView {
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
                                    .fill(currentPage == index ? Color.white : Color.gray.opacity(0.5))
                                    .frame(width: 8, height: 8)
                            }
                            Spacer()
                        }
                        .padding(.top, -8)
                        
                        // Cards List
                        VStack(spacing: 16) {
                            ForEach(cards) { card in
                                CardView(card: card)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Übersicht")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isLoggedIn = false
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

#Preview {
    OverviewView(isLoggedIn: .constant(true))
}
