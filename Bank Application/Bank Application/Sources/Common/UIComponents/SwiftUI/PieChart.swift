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
        .shadow(
            color: Color.black.opacity(0.1),
            radius: 5,
            x: 0,
            y: 2
        )
    }
}

#Preview {
    NavigationStack {
        PieChart(data: PieChartData.skills)
            .padding()
    }
} 
