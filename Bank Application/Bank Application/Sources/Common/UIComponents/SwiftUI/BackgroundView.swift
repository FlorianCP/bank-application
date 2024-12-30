import SwiftUI
import UIKit

struct BackgroundView<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Image("login_background")
                .resizable()
                .scaledToFill()
                .if(colorScheme == .light) { view in
                    view.blur(radius: 20)
                }
                .if(colorScheme == .dark) { view in
                    view
                        .overlay(Color.white)
                        .blur(radius: 20)
                }
                .opacity(0.25)
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width)
            
            content
        }
    }
}

#Preview {
    BackgroundView {
        Text("Hello, World!")
    }
}
