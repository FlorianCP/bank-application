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
    
    private func highlightedText(_ text: String) -> some View {
        if searchText.isEmpty {
            return Text(text)
        }
        
        let searchTerms = text.lowercased().ranges(of: searchText.lowercased())
            .map { Range<String.Index>(uncheckedBounds: ($0.lowerBound, $0.upperBound)) }
        
        let highlights = text.lowercased().ranges(of: searchText.lowercased())
            .reduce(Text("")) { current, range in
                let nextText = String(text[range])
                let previousEndIndex = searchTerms.firstIndex(of: range).map { index in
                    index > 0 ? searchTerms[index - 1].upperBound : text.startIndex
                } ?? text.startIndex
                let prefix = String(text[previousEndIndex..<range.lowerBound])
                return current + Text(prefix) + Text(nextText).foregroundColor(.accentColor).bold()
            }
        
        let lastIndex = searchTerms.last?.upperBound ?? text.startIndex
        let restString = String(text[lastIndex..<text.endIndex])
        let rest = Text(restString)
        return highlights + rest
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
                                    highlightedText(tenure.position)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    highlightedText("bei \(tenure.company)")
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    HStack {
                                        highlightedText(tenure.location)
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
                                highlightedText(task)
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
