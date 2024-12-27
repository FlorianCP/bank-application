import Foundation

struct Project: Identifiable {
    let id = UUID()
    let title: String
    let company: String
    let role: String
    let startDate: Date
    let endDate: Date
    let description: String
    let technologies: [String]
}

extension Project {
    static var projects: [Project] {
        return [
            Project(
                title: "Telefonbuch & Kalender App",
                company: "Land Oberösterreich",
                role: "Selbständig mit Codepool GmbH",
                startDate: DateComponents(year: 2012).toDate(),
                endDate: DateComponents(year: 2018).toDate(),
                description: """
Konzeption, Erstellung und Betreuung einer Telefonbuch- (iOS) sowie einer Kalender-App (iOS) für unseren Kunden Land Oberösterreich für die interne, sichere sowie rechtskonforme Nutzung durch Aussendienstmitarbeiter auf ihren Dienst-iPhones.

Interessante Themen des Projekts waren sowohl die Einhaltung von hohen Sicherheitsstandards (client-side Authorization mit SSL-Zertifikaten sowie Certificate-Pinning), als auch die Bereitstellung über den In-House App Store mit Hilfe des MDM (Mobile Device Management) des Kunden.
""",
                technologies: ["iOS", "SSL", "Certificate Pinning", "MDM", "In-House App Store"]
            ),
            Project(
                title: "Kundenkarten-App",
                company: "paysafecard",
                role: "Selbständig mit Codepool GmbH",
                startDate: DateComponents(year: 2012).toDate(),
                endDate: DateComponents(year: 2015).toDate(),
                description: "Entwicklung, Konzeption und Design einer Banking-App (iOS) für paysafecard. Mitarbeit im gesamten SDLC, inklusive Stakeholder Management sowie Triage und Behebung von Bugfixes. Einhaltung von Sicherheitsstandards und Audits nach OWASP.",
                technologies: ["Banking", "iOS", "SDLC", "Stakeholder Management", "OWASP"]
            ),
            Project(
                title: "Audioguide-App",
                company: "Hearonymus",
                role: "Selbständig mit Codepool GmbH",
                startDate: DateComponents(year: 2012).toDate(),
                endDate: DateComponents(year: 2018).toDate(),
                description: "Konzeption, Design, Erstellung, Publishing, Wartung und Betreuung einer Audioguide-App für unseren Kunden Hearonymus zur Verwendung von Endnutzern in Museen, Ausstellungen und Sehenswürdigkeiten, inklusive Möglichkeit zum Kauf von Audio-Guides.",
                technologies: ["iOS", "Audio", "In-App Purchase", "Location-based Services"]
            ),
            Project(
                title: "IKEA Family App",
                company: "IKEA",
                role: "Selbständig mit Codepool GmbH / 5lvlup GmbH",
                startDate: DateComponents(year: 2013).toDate(),
                endDate: DateComponents(year: 2018).toDate(),
                description: "Entwicklung und Konzeption einer Kundenkarten-App (iOS) für IKEA (IKEA Family App) in Österreich und der Schweiz. Mitarbeit im gesamten SDLC, inklusive Stakeholder Management sowie Triage und Behebung von Bugs.",
                technologies: ["iOS", "SDLC", "Stakeholder Management"]
            ),
            Project(
                title: "ZabCab Taxi Platform",
                company: "ZabCab",
                role: "Selbständig mit Codepool GmbH / 5lvlup GmbH",
                startDate: DateComponents(year: 2014).toDate(),
                endDate: DateComponents(year: 2017).toDate(),
                description:
"""
Übernahme der Tech Lead Rolle sowie des Entwicklungsparts für unseren Kunden ZabCab (inkl. Beteiligung an diesem amerikanischen Startup im Taxi Sektor) gemeinsam mit meinen Kollegen und einer unserer Partnerfirmen.
Die Vision des Startups war es, einen Gegenpol zu Uber in Zusammenarbeit mit etablierten Taxiunternehmen zu bilden.

Wir übernahmen Konzeption und Planung der Systemarchitektur, Erstellung und Wartung der Infrastruktur auf AWS, Entwicklung von mobilen Apps für Taxifahrer und Kunden, sowie Webapps für Concierges in Hotel-Lobbies und der Taxizentrale selbst.
""",
                technologies: ["Tech Lead", "System Architecture", "Backend", "Frontend", "Mobile Apps", "Web Apps", "AWS"]
            ),
            Project(
                title: "Versicherungspolizzen App",
                company: "traudi GmbH",
                role: "Selbständig mit Codepool GmbH & traudi GmbH",
                startDate: DateComponents(year: 2016).toDate(),
                endDate: DateComponents(year: 2018).toDate(),
                description:
"""
Gemeinsame Gründung der traudi GmbH mit Business Partnern.
Planung, Design, Konzeption sowie Umsetzung einer iOS App zur Verwaltung von Versicherungspolizzen und Indexanpassungen.
Erstellung eines Backends inklusive Admin-Oberfläche zur Verwaltung von hochgeladenen Polizzen inkl. automatischer Kategorisierung.
Planung, Konzeption und Inbetriebnahme einer Backend-Architektur zur Unterstützung dieser Prozesse.
""",
                technologies: ["iOS", "Backend", "Frontend", "Project Management", "System Architecture"]
            ),
            Project(
                title: "adidas Training & Running Apps",
                company: "runtastic GmbH / adidas",
                role: "Senior iOS Engineer",
                startDate: DateComponents(year: 2018).toDate(),
                endDate: DateComponents(year: 2023).toDate(),
                description:
"""
Entwicklung und Implementierung von Features für die adidas Training, adidas Running und runtastic Balance iOS Apps als Senior iOS Engineer bei runtastic / adidas.

Beteiligung am gesamten SDLC, Durchführung von Code Reviews und Mentoring von Engineers.
Warnehmung der Rolle des Release Managers für die runtastic Balance und adidas Training Apps.
Koordination und Ausführung von Release-Integrationen, Stakeholder-Kommunikation, manual Testreporting und QA-Freigabe, Veröffentlichung und Überwachung sowie Triage und Planung von kritischen Fehlerbehebungen.
Temporär als Scrum Master tätig, inklusive Sprint Planning, Daily Scrum, Retrospektiven, Backlog Refinement, Magic Estimations und Roadmap Planning.
Einführung mehrerer Combine-basierter Features und SwiftUI-Screens in der adidas Training App sowie Integration des servergesteuerten nativen UI-Frameworks adidas Latte.
Verbesserung von CI/CD-Pipelines und Prozessen.
Teilnahme an koordinierten WWDC-Lern- und Research-Sessions und Durchführung von Knowledge Transfer Sessions.
""",
                technologies: ["iOS", "SwiftUI", "Combine", "CI/CD", "Scrum Master", "Release Management", "Mentoring"]
            )
        ]
    }
} 
