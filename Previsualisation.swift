import SwiftUI
import WebKit

struct VideoView3: UIViewRepresentable {
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
        var parent: VideoView3

        init(_ parent: VideoView3) {
            self.parent = parent
        }
    }
}


struct ContentView4: View {
    @State private var showDetails = false
    @State private var currentIndex = 0
    
    let images = ["previs"]
    
    let items = [
        ("📚🤔 Previsualisation🤔📚", "previs")
    ]
    
    let descriptions = [
        ("Previsualization is a crucial step in animation that helps creators plan and visualize the animation's story, shots, and overall flow before the actual production process begins. It allows animators and directors to experiment with different shots, sequences, and pacing, ultimately leading to a more polished and cohesive final product.")
    ]
    
    let ytLinks = [
        ("https://www.youtube.com/watch?v=3czLCdX5QG4")
        
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

