import SwiftUI

struct BackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Image("login_background")
                .resizable()
                .scaledToFill()
                .blur(radius: 20)
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