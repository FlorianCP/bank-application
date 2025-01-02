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
    @MainActor
    init() {
        setupInitialState()
    }
    
    // MARK: - Public Methods
    func calculateAvatarCornerRadius(for frame: CGRect) -> CGFloat {
        return frame.width / 2
    }
    
    // MARK: - Private Methods
    @MainActor
    private func setupInitialState() {
        // Load avatar image
        avatarImage = UIImage(named: "profile_pic")
        
        // Setup sections
        sections = [
            PersonalSection(
                title: "Persönliches",
                content: """
                \(UICardView.bulletPoint) Vater von 2 Kindern und leidenschaftlicher Familienmensch.
                \(UICardView.bulletPoint) Begeisterter Camper, der gerne Zeit in der Natur verbringt.
                \(UICardView.bulletPoint) Kraftsportler und DIY-Enthusiast mit eigener kleiner Holzwerkstatt.
                \(UICardView.bulletPoint) Wertschätzt Ehrlichkeit, Fairness, Respekt und Loyalität im persönlichen Leben.
                \(UICardView.bulletPoint) Offen für Neues, wissbegierig und mit Freude an kreativen Hobbys und Projekten.
                """
            ),
            PersonalSection(
                title: "Technische Expertise",
                content: """
                \(UICardView.bulletPoint) iOS-Entwicklung: Umfassende Erfahrung mit Swift, Combine, SwiftUI und CI/CD-Pipelines.
                \(UICardView.bulletPoint) Full-Stack-Entwicklung: Breites Know-how in Backend-Entwicklung (Typescript, Python, PHP) und Frontend-Technologien wie React, Next.js, Vue.js und Symfony.
                \(UICardView.bulletPoint) KI-Technologien: Erfahrung mit Large Language Models, Stable Diffusion, RAG und Vektordatenbanken.
                \(UICardView.bulletPoint) Zusätzliche Kenntnisse in React Native und Flutter für plattformübergreifende Entwicklung.
                """
            ),
            PersonalSection(
                title: "Berufserfahrung und Arbeitsweise",
                content: """
                \(UICardView.bulletPoint) iOS: Entwicklung hochwertiger Anwendungen für Endnutzer und Geschäftskunden, Tätigkeit als Release Manager für mehrere Apps.
                \(UICardView.bulletPoint) Leadership: Verantwortung für Key Results im OKR-Prozess, Roadmap-Planung und Weiterentwicklung agiler Prozesse als Scrum Master bei runtastic/adidas.
                \(UICardView.bulletPoint) Unternehmer: Zielmärkte in Österreich, Deutschland, Schweiz und den USA bedient. Projekte reichten von Apps für Banken bis hin zu internen Anwendungen und Tech-Leadership für Scale-Ups.
                """
            ),
            PersonalSection(
                title: "Philosophie und Werte",
                content: """
                \(UICardView.bulletPoint) Einfachheit: Fokus auf wartbare und effiziente Software, Vermeidung von Over-Engineering.
                \(UICardView.bulletPoint) Kundennutzen: Schaffung maximalen Mehrwerts mit minimalem Aufwand bei gleichzeitiger Berücksichtigung von Technologie und Wartbarkeit.
                \(UICardView.bulletPoint) Teamarbeit: Förderung leistungsstarker Teams durch offene Kommunikation, Empathie und Kooperation.
                """
            ),
            PersonalSection(
                title: "Weiterentwicklung und Wissbegierde",
                content: """
                \(UICardView.bulletPoint) Leidenschaft für das Lernen neuer Technologien und Konzepte wie KI, moderne Entwicklungsframeworks und Plattformen.
                \(UICardView.bulletPoint) Visionär in Bezug auf die Veränderungen in der Softwareentwicklung durch KI.
                \(UICardView.bulletPoint) Engagement für persönliche und fachliche Weiterentwicklung, sowohl individuell als auch im Teamkontext.
                """
            )
        ]
    }
} 

#Preview(traits: .sizeThatFitsLayout, body: {
    let navigationController = UINavigationController(rootViewController: UIViewController())
    navigationController.pushViewController(PersonalDetailsViewController(), animated: false)
    return navigationController
})
