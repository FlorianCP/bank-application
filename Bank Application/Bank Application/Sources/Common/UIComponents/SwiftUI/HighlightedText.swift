//
//  HighlightedText.swift
//  Bank Application
//
//  Created by Florian Rath on 27.12.24.
//

import SwiftUI

struct HighlightedText: View {
    let text: String
    let highlight: String?
    
    init(_ text: String, highlight: String?) {
        self.text = text
        self.highlight = highlight
    }
    
    var body: some View {
        highlightedText(text, searchText: highlight ?? "")
    }
    
    private func highlightedText(_ text: String, searchText: String) -> some View {
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
}

#Preview {
    HighlightedText("Das ist ein Text", highlight: "ein")
}
