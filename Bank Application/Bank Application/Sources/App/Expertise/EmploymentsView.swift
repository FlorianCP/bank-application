import SwiftUI

struct EmploymentsView: View {
    @State private var employments = Employment.cvItems
    @State private var searchText = ""
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            ForEach($employments) { employment in
                VStack(alignment: .leading, spacing: 12) {
                    // Tenures
                    ForEach(employment.wrappedValue.tenures, id: \.startDate) { tenure in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(tenure.position)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text(tenure.company)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    HStack {
                                        Text(tenure.location)
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        
                                        Text("•")
                                            .foregroundColor(.gray)
                                        
                                        Text("\(dateFormatter.string(from: tenure.startDate)) - \(dateFormatter.string(from: tenure.endDate))")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                    }
                    
                    // Tasks
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Aufgaben:")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.top, 4)
                        
                        ForEach(employment.wrappedValue.tasks, id: \.self) { task in
                            HStack(alignment: .top) {
                                Text("•")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Text(task)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Berufserfahrung")
        .searchable(text: $searchText, prompt: "Suchen...")
    }
}

#Preview {
    NavigationStack {
        EmploymentsView()
    }
} 
