import SwiftUI
import Charts

struct SkillProgressChart: View {
    let skillProgress: [SkillProgress]
    
    var body: some View {
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
    }
}

#Preview {
    NavigationStack {
        SkillProgressChart(skillProgress: SkillProgress.sampleData)
            .padding()
    }
} 
