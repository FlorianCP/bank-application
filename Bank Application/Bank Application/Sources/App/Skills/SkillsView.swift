import SwiftUI
import Charts

struct SkillsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                LineChart(data: LineChartData.skillDevelopment)
                PieChart(data: PieChartData.skills)
                PieChart(data: PieChartData.languages)
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
