import SwiftUI

struct ProjectsView: View {
    @State private var projects = Project.projects
    @State private var searchText = ""
    @State private var isSearching = false
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    private var filteredProjects: [Project] {
        if searchText.isEmpty {
            return projects
        }
        
        return projects.filter { project in
            project.title.localizedCaseInsensitiveContains(searchText) ||
            project.company.localizedCaseInsensitiveContains(searchText) ||
            project.role.localizedCaseInsensitiveContains(searchText) ||
            project.description.localizedCaseInsensitiveContains(searchText) ||
            project.technologies.contains { tech in
                tech.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(filteredProjects) { project in
                VStack(alignment: .leading, spacing: 12) {
                    // Title and Company
                    VStack(alignment: .leading, spacing: 4) {
                        HighlightedText(project.title, highlight: searchText)
                            .font(.system(size: 16, weight: .semibold))
                        
                        HighlightedText("für \(project.company)", highlight: searchText)
                            .font(.system(size: 15, weight: .medium))
                        
                        HStack {
                            HighlightedText(project.role, highlight: searchText)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            
                            Text("•")
                                .foregroundColor(.gray)
                            
                            Text("\(dateFormatter.string(from: project.startDate)) - \(dateFormatter.string(from: project.endDate))")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Description
                    HighlightedText(project.description, highlight: searchText)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    
                    // Technologies
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(project.technologies, id: \.self) { tech in
                                Pill(tech)
                            }
                        }
                    }
                    .padding(.top, 8)
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Projekterfahrung")
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
        ProjectsView()
    }
} 
