import SwiftUI
import Charts

struct PieChart: View {
    let data: PieChartData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(data.title)
                .font(.headline)
                .padding(.leading)
            
            Chart(data.values) { category in
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
        PieChart(data: PieChartData.skills)
            .padding()
    }
} 
