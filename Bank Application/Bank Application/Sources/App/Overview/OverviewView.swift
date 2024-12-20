import SwiftUI

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    @State private var currentPage = 0
    
    // Sample cards data
    let cards = [
        Card(
            title: "Expertise",
            subtitle: "Ein Überblick über meine Fähigkeiten",
            description: "Erfahren Sie mehr über meine Expertise und Fähigkeiten.",
            smallText: "Mehr erfahren"
        ),
        Card(
            title: "Persönliche Werte",
            subtitle: "Meine und Ihre Werte im Einklang",
            description: "Erhalten Sie einen Überblick über meine Werte und wie diese mit Ihren übereinstimmen.",
            smallText: "Details anzeigen"
        ),
        Card(
            title: "Lebenslauf",
            subtitle: "Mein Lebenslauf als PDF",
            description: "Erfahren Sie mehr über mich indem Sie meinen Lebenslauf ansehen.",
            smallText: "Zum Lebenslauf"
        ),
        Card(
            title: "Profil und Projekterfahrung",
            subtitle: "Mein Profil als PDF",
            description: "Erhalten Sie einen Überblick über meine Projekte und Erfahrungen.",
            smallText: "Zum Profil"
        ),
        Card(
            title: "Persönliches",
            subtitle: "Infos über meine Person",
            description: "Erfahren Sie mehr über mich und meine persönliche Situation.",
            smallText: "Überblick erhalten"
        ),
    ]
    
    // Sample news data
    let newsItems = [
        News(
            title: "Vielfältige Skills",
            description: "Zukunftssicherheit für Ihr Unternehmen mit diesem Bewerber.",
            image: "skills"
        ),
        News(
            title: "Großer Erfahrungsschatz",
            description: "Entdecken Sie die Projekterfahrung des Bewerbers.",
            image: "experience"
        ),
        News(
            title: "Vorsorge für Ihr Unternehmen",
            description: "Sorgen Sie jetzt vor, mit Florian Rath als Mitarbeiter.",
            image: "profile_pic"
        ),
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
