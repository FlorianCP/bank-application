import SwiftUI
import Charts

struct SkillDistributionChart: View {
    let skillCategories: [SkillCategory]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Skill-Verteilung")
                .font(.headline)
                .padding(.leading)
            
            Chart(skillCategories) { category in
                Plot {
                    SectorMark(
                        angle: .value("Prozent", category.percentage),
                        innerRadius: .ratio(0.618),
                        angularInset: 1.5
                    )
                    .foregroundStyle(by: .value("Kategorie", category.name))
                }
            }
            .frame(height: 300)
            .chartLegend(position: .bottom)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    NavigationStack {
        SkillDistributionChart(skillCategories: SkillCategory.sampleData)
            .padding()
    }
} 