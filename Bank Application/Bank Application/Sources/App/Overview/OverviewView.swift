import SwiftUI
import UIKit

struct OverviewView: View {
    @Binding var isLoggedIn: Bool
    @State private var currentPage = 0
    @State private var showingPersonalDetails = false
    @State private var showingExpertise = false

    private enum CardIdentifier: String {
        case expertise
        case projects
        case skills
        case values
        case resume
        case profile
        case personal
    }
    
    // Sample cards data
    private let cards = [
        Card(
            title: "Berufserfahrung",
            subtitle: "Chronologische Liste aller Anstellungen",
            description: "Erfahren Sie mehr über meine Berufserfahrung.",
            smallText: "Mehr erfahren",
            identifier: CardIdentifier.expertise.rawValue,
            imageName: "briefcase.fill"
        ),
        Card(
            title: "Projekterfahrung",
            subtitle: "Eine Liste mit Highlights meiner Projekte",
            description: "Erfahren Sie mehr über meine durchgeführten Projekte.",
            smallText: "Details anzeigen",
            identifier: CardIdentifier.projects.rawValue,
            imageName: "folder.fill"
        ),
        Card(
            title: "Skills",
            subtitle: "Eine Liste mit meinen Skills",
            description: "Erfahren Sie mehr über meine Fähigkeiten und Kenntnisse.",
            smallText: "Details anzeigen",
            identifier: CardIdentifier.skills.rawValue,
            imageName: "star.fill"
        ),
        Card(
            title: "Persönliche Werte",
            subtitle: "Meine und Ihre Werte im Einklang",
            description: "Erhalten Sie einen Überblick über meine Werte und wie diese mit Ihren übereinstimmen.",
            smallText: "Details anzeigen",
            identifier: CardIdentifier.values.rawValue,
            imageName: "heart.fill"
        ),
        Card(
            title: "Persönliches",
            subtitle: "Infos über meine Person",
            description: "Erfahren Sie mehr über mich und meine persönliche Situation.",
            smallText: "Überblick erhalten",
            identifier: CardIdentifier.personal.rawValue,
            imageName: "person.text.rectangle.fill"
        ),
        Card(
            title: "Lebenslauf",
            subtitle: "Mein Lebenslauf als PDF",
            description: "Erfahren Sie mehr über mich indem Sie meinen Lebenslauf ansehen.",
            smallText: "Zum Lebenslauf",
            identifier: CardIdentifier.resume.rawValue,
            imageName: "doc.fill"
        ),
        Card(
            title: "Profil und Projekterfahrung",
            subtitle: "Mein Profil als PDF",
            description: "Erhalten Sie einen Überblick über meine Projekte und Erfahrungen.",
            smallText: "Zum Profil",
            identifier: CardIdentifier.profile.rawValue,
            imageName: "doc.fill"
        ),
    ]
    
    // Sample news data
    private let newsItems = [
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
        NavigationStack {
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
                                CardView(card: card) { identifier in
                                    guard let cardIdentifier = CardIdentifier(rawValue: identifier) else { return }
                                    switch cardIdentifier {
                                        case CardIdentifier.expertise:
                                            showingExpertise = true
                                        case CardIdentifier.projects:
                                            break
                                        case CardIdentifier.skills:
                                            break
                                        case CardIdentifier.values:
                                            break
                                        case CardIdentifier.resume:
                                            let url = URL(string: "https://www.rath.space/Lebenslauf.pdf")!
                                            UIApplication.shared.open(url)
                                        case CardIdentifier.profile:
                                            let url = URL(string: "https://www.rath.space/Profil.pdf")!
                                            UIApplication.shared.open(url)
                                        case CardIdentifier.personal:
                                            showingPersonalDetails = true
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
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
            .sheet(isPresented: $showingPersonalDetails) {
                NavigationStack {
                    PersonalDetailsViewControllerRepresentable()
                        .navigationBarTitleDisplayMode(.automatic)
                        .navigationTitle("Persönliches")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showingPersonalDetails = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                }
            }
            .navigationDestination(isPresented: $showingExpertise) {
                EmploymentsView()
            }
        }
    }
}

#Preview {
    OverviewView(isLoggedIn: .constant(true))
}
