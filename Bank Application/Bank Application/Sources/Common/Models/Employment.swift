import Foundation

struct Tenure {
    let startDate: Date
    let endDate: Date
    let position: String
    let company: String
    let location: String
}

struct Employment: Identifiable {
    let id = UUID()
    let tenures: [Tenure]
    let tasks: [String]
}

extension Employment {
    static var cvItems: [Employment] {
        return [
            // Haicu Systems GmbH
            Employment(
                tenures: [
                    Tenure(
                        startDate: DateComponents(year: 2023, month: 11).toDate(),
                        endDate: DateComponents(year: 2024, month: 12).toDate(),
                        position: "Mitgründer",
                        company: "Haicu Systems GmbH",
                        location: "Linz, Remote"
                    )
                ],
                tasks: [
                    "Planung und Entwicklung eines Backends für eine GenAI (Generative KI) Application mit Langchain in Python, bestehend aus mehreren Services",
                    "Erstellung und managen einer PostgreSQL Datenbank in mehreren Umgebungen (dev, staging und production), inklusive Entwicklung und Ausführung von Datenbankmigrationen sowie Installation, Setup und Benutzung von pgvector als Vektor Datenbank Extension für RAG (Retrieval Augmented Generation) für das zugrundeliegende LLM",
                    "Installation, Setup und Benutzung von pgvector als Vektor Datenbank Extension für RAG (Retrieval Augmented Generation) für das zugrundeliegende LLM",
                    "Mithilfe bei der Entwicklung eines Frontends der GenAI Anwendung in Vue.js",
                    "Verwalten der Infrastruktur auf render.com",
                    "Erstellung eines Logos, der CI und der Webseite für das Unternehmen"
                ]
            ),
            
            // Runtastic/Adidas
            Employment(
                tenures: [
                    Tenure(
                        startDate: DateComponents(year: 2018, month: 5).toDate(),
                        endDate: DateComponents(year: 2023, month: 10).toDate(),
                        position: "Senior iOS Engineer",
                        company: "runtastic GmbH / adidas",
                        location: "Linz, Remote"
                    )
                ],
                tasks: [
                    "Entwicklung, Implementierung und Wartung von Features für die iOS-Apps adidas Training, adidas Running und runtastic Balance als Senior iOS Engineer. Aktive Teilnahme am gesamten Softwareentwicklungslebenszyklus (SDLC), Durchführung von Code-Reviews sowie Mentoring und Guidance für andere Engineers",
                    "Übernahme der Rolle des Release Managers für die Apps runtastic Balance und adidas Training. Koordination und Durchführung von Release-Integrations, Stakeholder- Kommunikation, manueller Testberichterstattung und QA-Freigabe, Veröffentlichung, Monitoring und Planung von Fixes für kritische Probleme",
                    "Temporäre Übernahme der Rolle des Scrum Masters für den eigenen Squad für etwa eineinhalb Jahre. Moderation von Sprint-Planning, Daily Standups, Retrospektiven, Backlog-Refinement-Sitzungen, Magic Estimations und Roadmap-Planungssitzungen zusätzlich zu meinen regulären Engineering-Aufgaben",
                    "Ownership und driving von Key Results im Rahmen von Squad-, Tribe- und Chapter-weiten OKRs",
                    "Aktive Teilnahme an Agile-Chapter sowie iOS-Guild bzw. iOS-Chapter Aktivitäten",
                    "Einführung mehrerer Combine-basierter Features in der adidas Training-App sowie Durchführung mehrerer Knowledge-Transfer Sessions zu Combine und TCA (The Composable Architecture)",
                    "Einführung mehrerer SwiftUI Screens in der adidas Training-App",
                    "Integration des adidas Latte-Frameworks, eines server-driven native UI Frameworks, in die Apps. Durchführung von Troubleshooting Sessions und Unterstützung bei der Wartung und Fehlerbehebung im Framework",
                    "Verbesserung unserer CI/CD-Pipelines und -Prozesse in Zusammenarbeit mit Kollegen aus dem Chapter",
                    "Aktive Teilnahme an WWDC Learning und Research Sessions sowie Durchführung von Knowledge Transfer Sessions"
                ]
            ),
            
            // Codepool GmbH and 5lvlup GmbH (Combined due to continuity)
            Employment(
                tenures: [
                    Tenure(
                        startDate: DateComponents(year: 2011, month: 12).toDate(),
                        endDate: DateComponents(year: 2017, month: 9).toDate(),
                        position: "Mitgründer",
                        company: "Codepool GmbH",
                        location: "Linz"
                    ),
                    Tenure(
                        startDate: DateComponents(year: 2017, month: 9).toDate(),
                        endDate: DateComponents(year: 2019, month: 1).toDate(),
                        position: "Mitgründer",
                        company: "5lvlup GmbH",
                        location: "Linz"
                    )
                ],
                tasks: [
                    "Beitragen zur strategischen Entscheidungsfindung und Geschäftsentwicklung im Rahmen des C-Level-Teams unserer Softwareagentur, mit dem Ziel, das Unternehmen erfolgreich zu lenken",
                    "Übernahme von Kundenkommunikation, Key-Account-Managements, Consulting, Projektplanung und Requirements Engineering. Sicherstellung einer klaren und effektiven Zusammenarbeit mit Kunden, die von Einzelunternehmern bis hin zu Regierungsabteilungen und Unternehmen mit einem Umsatz von über einer Milliarde Euro reichen und in Branchen wie Finanzen, Fitness und Gesundheit, Logistik und Mobilität in den DACH- und US-Märkten agieren",
                    "Mentoring, Guidance und Beratung der Mitarbeiter in technischen Angelegenheiten sowie Management und Support zur Erreichung der Projektziele und der Sicherstellung qualitativ hochwertiger Ergebnisse",
                    "Teilnahme am gesamten Softwareentwicklungslebenszyklus (SDLC), hauptsächlich für iOS- Apps sowie Symfony-Webanwendungen, Websites und Backends"
                ]
            )
        ]
    }
}
