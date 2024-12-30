import SwiftUI
import Charts

struct SkillsView: View {
    let skillProgress = SkillProgress.sampleData
    let skillCategories = SkillCategory.sampleData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Progress over time chart
                VStack(alignment: .leading) {
                    Text("Skill-Entwicklung über Zeit")
                        .font(.headline)
                        .padding(.leading)
                    
                    Chart {
                        ForEach(skillProgress) { skill in
                            ForEach(skill.progressPoints) { point in
                                LineMark(
                                    x: .value("Datum", point.date),
                                    y: .value("Level", point.level)
                                )
                                .foregroundStyle(by: .value("Skill", skill.skillName))
                                .symbol(by: .value("Skill", skill.skillName))
                                .interpolationMethod(.catmullRom)
                            }
                        }
                    }
                    .frame(height: 300)
                    .chartXAxis {
                        AxisMarks(values: .stride(by: .year)) { value in
                            AxisGridLine()
                            AxisValueLabel(format: .dateTime.year())
                        }
                    }
                    .chartYAxis {
                        AxisMarks { value in
                            AxisGridLine()
                            AxisValueLabel("\(value.index * 20)%")
                        }
                    }
                    .chartLegend(position: .bottom)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .shadow(radius: 5)
                
                // Skill distribution chart
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
            .padding()
        }
        .navigationTitle("Skills")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        SkillsView()
    }
} 
