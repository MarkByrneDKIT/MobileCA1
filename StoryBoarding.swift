import SwiftUI
import WebKit

struct VideoView2: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: VideoView2

        init(_ parent: VideoView2) {
            self.parent = parent
        }
    }
}


struct ContentView3: View {
    @State private var showDetails = false
    @State private var currentIndex = 0
    
    let images = ["3D", "2D", "techniques", "rigging", "storyboard", "previs"]
    
    let items = [
        ("✍️📝 StoryBoarding 📝✍️", "storyboard"),
    ]
    
    let descriptions = [
        ("Before diving into animatic development, creators use storyboarding and previsualization to plan and visualize the animation's story, shots, and overall flow. Both 2D and 3D animation processes start with the creation of storyboards that illustrate the key scenes and transitions in the project. Previsualization involves creating rough, low-resolution animations to establish the timing, pacing, and camera movements, ensuring that the final product aligns with the director's vision.")
    ]
    
    let ytLinks = [
        ("https://www.youtube.com/watch?v=RQsvhq28sOI")
        
        ]
    func extractVideoID(from url: String) -> String? {
        if let components = URLComponents(string: url),
           let queryItems = components.queryItems,
           let videoParam = queryItems.first(where: { $0.name == "v" }) {
            return videoParam.value
        }
        return nil
    }

    
    let transition = AnyTransition.opacity.animation(.easeInOut(duration: 2))
    
    var body: some View {
        ZStack {
            Image("orange")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(items[currentIndex].0)
                    .bold()
                    .transition(AnyTransition.slide)
                    .animation(.easeInOut(duration: 1)) // Add animation to the slide transition
                
                
                
                Image(items[currentIndex].1)
                    .frame(width: 350.0, height: 350.0)
                    .clipShape(Circle())
                    .transition(AnyTransition.slide)
                    .animation(.easeInOut(duration: 1))
                    .onTapGesture {
                        withAnimation {
                            self.showDetails.toggle()
                        }
                    }
                    .transition(.scale)
                
                
                
                ScrollView {
                    VStack {
                        Text(descriptions[currentIndex])
                            .frame(width: 350)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .transition(AnyTransition.slide)
                            .animation(.easeInOut(duration: 1)) // Add animation to the slide transition
                        
                        if let videoID = extractVideoID(from: ytLinks[currentIndex]) {
                            VideoView(videoID: videoID)
                                .frame(width:380, height: 200)
                        }
                    }
                }
                .transition(.slide)

      
            }
        }
    }
}

