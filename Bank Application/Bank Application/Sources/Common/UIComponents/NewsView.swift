import SwiftUI

struct News: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageUrl: String
}

struct NewsView: View {
    let news: News
    
    var body: some View {
        HStack(spacing: 12) {
            // Image placeholder with system image
            Image(systemName: "newspaper.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(news.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .frame(width: 200, alignment: .leading)
        }
        .frame(width: 300)
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    NewsView(news: News(
        title: "New Feature Release",
        description: "Check out our latest banking features and improvements",
        imageUrl: "placeholder"
    ))
} 