//
//  PersonalDetailsViewModel.swift
//  Bank Application
//
//  Created by Florian Rath on 21.12.24.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct PersonalSection: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

final class PersonalDetailsViewModel: ObservableObject {
    // MARK: - Public Properties
    @Published private(set) var avatarImage: UIImage?
    @Published private(set) var sections: [PersonalSection] = []
    
    private(set) var avatarWidth: CGFloat = 200
    
    // MARK: - Private Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init() {
        setupInitialState()
    }
    
    // MARK: - Public Methods
    func calculateAvatarCornerRadius(for frame: CGRect) -> CGFloat {
        return frame.width / 2
    }
    
    // MARK: - Private Methods
    private func setupInitialState() {
        // Load avatar image
        avatarImage = UIImage(named: "profile_pic")
        
        // Setup sections
        sections = [
            PersonalSection(
                title: "Persönliches",
                content: """
                👨‍💻 Senior Software Engineer und T-shaped Developer mit über 13 Jahren Berufserfahrung
                📃 Mitgründer von 4 Unternehmen
                👨‍👩‍👦‍👦 Vater von 2 Kindern
                🚐 Begeisterter Camper
                🏋️ Kraftsportler
                🔨 Bastler mit eigener kleiner Holzwerkstatt
                """
            ),
            PersonalSection(
                title: "Über Mich",
                content: "Ich bin ein kreativer und technologiebegeisterter Entwickler, der gerne an innovativen Projekten arbeitet und sich stetig weiterentwickelt. In meiner Freizeit kombiniere ich meine Leidenschaft für Technologie mit Kreativität, sei es durch die Entwicklung von Spielen, die Nutzung moderner Frameworks wie React Native oder das Entwerfen von Websites mit einem besonderen Twist."
            ),
            PersonalSection(
                title: "Persönliche Interessen",
                content: "Außerhalb der Arbeit interessiere ich mich für spannende Technologien, die kreative Möglichkeiten eröffnen, sowie für Projekte, die das Leben anderer verbessern – von der Kundenbindung bis hin zu familienfreundlichen Anwendungen. Mein Interesse an Logik, Design und Storytelling zeigt sich in meinen Projekten, die oft eine spielerische und interaktive Komponente haben."
            ),
            PersonalSection(
                title: "Werte & Philosophie",
                content: "Ich lege großen Wert auf die Verbindung von Kreativität und Struktur, sei es in der Softwareentwicklung oder im täglichen Leben. Werte wie Teamarbeit, offene Kommunikation und kontinuierliches Lernen sind mir besonders wichtig. Ich bin überzeugt davon, dass Technologie nicht nur funktional, sondern auch inspirierend und zugänglich sein sollte."
            )
        ]
    }
} 
