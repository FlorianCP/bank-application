import SwiftUI

struct ValuesView: View {
    private let values = Value.values
    
    var body: some View {
        BackgroundView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(values) { value in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: value.sfSymbol)
                                    .font(.title2)
                                    .foregroundColor(.accentColor)
                                
                                Text(value.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            
                            Text(value.description)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .shadow(
                            color: Color.black.opacity(0.1),
                            radius: 5,
                            x: 0,
                            y: 2
                        )
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Meine Werte")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationStack {
        ValuesView()
    }
}
