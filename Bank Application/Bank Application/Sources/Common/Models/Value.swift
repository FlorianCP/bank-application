import Foundation
import SwiftUI

struct Value: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let sfSymbol: String
}

extension Value {
    static let values = [
        Value(
            title: "Ehrlichkeit",
            description: "Ehrlichkeit ist für mich die Grundlage für jegliche vertrauensvolle Zusammenarbeit. Ich versuche stets meine Worte und Handlungen klar und transparent zu halten, und ich erwarte das gleiche von meinen Kollegen und Partnern. Ehrlichkeit ist für mich die Grundlage für ein gutes Leben.",
            sfSymbol: "person.fill.checkmark"
        ),
        Value(
            title: "Fairness",
            description: "Fairness bedeutet für mich, alle Situationen und Menschen möglichst unvoreingenommen zu betrachten und gerecht zu handeln. Meiner Meinung nach sollte sich jeder Mensch seiner Vorurteile möglichst bewusst werden, da dies der Schlüssel für eine faire Behandlung ist. Im Arbeitsalltag setze ich mich für ausgewogene Lösungen ein, die allen Beteiligten gerecht werden und eine positive Arbeitsatmosphäre fördern.",
            sfSymbol: "scale.3d"
        ),
        Value(
            title: "Respekt",
            description: "Respektvoller Umgang ist die Basis für eine erfolgreiche Zusammenarbeit. Ich versuche stets allen Menschen mit Wertschätzung zu begegnen, unabhängig von ihrer Position oder ihrem Hintergrund. Nur durch gegenseitigen Respekt können wir ein inklusives und produktives Arbeitsumfeld schaffen.",
            sfSymbol: "person.2.fill"
        ),
        Value(
            title: "Loyalität",
            description: "Loyalität zeigt sich in der Verlässlichkeit und dem Engagement für das Team und das Unternehmen. Ich stehe zu meinen Zusagen und unterstütze meine Kollegen auch in herausfordernden Situationen. Loyalität bedeutet für mich auch, konstruktive Kritik zu üben, wenn es dem gemeinsamen Erfolg dient, sowie konstruktive Kritik anzunehmen und darüber zu reflektieren.",
            sfSymbol: "heart.fill"
        ),
        Value(
            title: "Einfachheit",
            description: "Ich bin ein großer Freund von Einfachheit, sowohl in der Softwareentwicklung, als auch im Teamgefüge. Einfachheit entsteht aber nicht von alleine, man muss konsequent daran arbeiten Software und Prozesse einfach zu halten.",
            sfSymbol: "sparkles"
        ),
        Value(
            title: "Eigenverantwortung",
            description: "Als erfahrener Senior Engineer lege ich großen Wert auf Eigenverantwortung. Besonders dank meiner selbständigen Tätigkeit bringe ich die Fähigkeit mit, selbstständig Entscheidungen zu treffen (selbstverständlich in Koordination mit allen Stakeholdern). Ich versuche auch aktiv eine Kultur der Eigenverantwortung im Team zu fördern. Dies führt zu effizienteren Prozessen und stärkerem Engagement aller Teammitglieder.",
            sfSymbol: "person.fill.checkmark"
        ),
        Value(
            title: "Transparenz",
            description: "Transparenz ist der Schlüssel zu erfolgreicher Zusammenarbeit. Ich setze mich für offene Kommunikation, klare Dokumentation und nachvollziehbare Entscheidungsprozesse ein. Nur durch Transparenz können wir voneinander lernen und gemeinsam wachsen.",
            sfSymbol: "eye.fill"
        ),
        Value(
            title: "Vertrauen",
            description: "Vertrauen bildet das Fundament erfolgreicher Teamarbeit. Insbesondere auch seit meiner Tätigkeit als Scrum Master versuche ich eine Atmosphäre zu schaffen, in der sich alle Teammitglieder sicher fühlen, Ideen zu teilen, Fehler einzugestehen und aus ihnen zu lernen. Vertrauen ermöglicht es uns, schneller und innovativer zu arbeiten, eine höhere Mitarbeiterzufriedenheit zu erreichen und letztendlich auch eine höhere Produktivität zu erzielen.",
            sfSymbol: "hand.raised.fill"
        )
    ]
}

#Preview {
    NavigationStack {
        ValuesView()
    }
}
