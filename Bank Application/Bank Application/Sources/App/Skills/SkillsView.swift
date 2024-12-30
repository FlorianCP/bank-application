import SwiftUI
import Charts

struct SkillsView: View {
    let skillProgress = SkillProgress.sampleData
    let skillCategories = SkillCategory.sampleData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                SkillProgressChart(skillProgress: skillProgress)
                SkillDistributionChart(skillCategories: skillCategories)
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
