//
//  Pill.swift
//  Bank Application
//
//  Created by Florian Rath on 27.12.24.
//

import SwiftUI

struct Pill: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 12))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.accentColor.opacity(0.1))
            .foregroundColor(.accentColor)
            .cornerRadius(12)
    }
}

#Preview {
    Pill("Test")
}
