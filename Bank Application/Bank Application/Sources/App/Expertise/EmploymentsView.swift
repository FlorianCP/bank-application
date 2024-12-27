import SwiftUI

struct EmploymentsView: View {
    @State private var employments = Employment.cvItems
    @State private var searchText = ""
    @State private var isSearching = false
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    private var filteredEmployments: [Employment] {
        if searchText.isEmpty {
            return employments
        }
        
        return employments.filter { employment in
            // Check if any tenure matches the search criteria
            let tenureMatch = employment.tenures.contains { tenure in
                tenure.position.localizedCaseInsensitiveContains(searchText) ||
                tenure.company.localizedCaseInsensitiveContains(searchText) ||
                tenure.location.localizedCaseInsensitiveContains(searchText)
            }
            
            // Check if any task matches the search criteria
            let taskMatch = employment.tasks.contains { task in
                task.localizedCaseInsensitiveContains(searchText)
            }
            
            return tenureMatch || taskMatch
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredEmployments) { employment in
                VStack(alignment: .leading, spacing: 12) {
                    // Tenures
                    ForEach(Array(employment.tenures.indices), id: \.self) { index in
                        let tenure = employment.tenures[index]
                        VStack(alignment: .leading, spacing: 8) {
                            if index > 0 {
                                Text("&")
                            }
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    HighlightedText(tenure.position, highlight: searchText)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    HighlightedText("bei \(tenure.company)", highlight: searchText)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    HStack {
                                        HighlightedText(tenure.location, highlight: searchText)
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
                        
                        ForEach(employment.tasks, id: \.self) { task in
                            HStack(alignment: .top) {
                                Text("•")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                HighlightedText(task, highlight: searchText)
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
        .searchable(text: $searchText, isPresented: $isSearching, prompt: "Suchen...")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isSearching = true
                }) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EmploymentsView()
    }
} 
