import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
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
        var parent: VideoView

        init(_ parent: VideoView) {
            self.parent = parent
        }
    }
}


struct TopicView1: View {
    @State private var showDetails = false
    @State private var currentIndex = 0
    
    
    let images = ["3D", "2D", "techniques", "rigging"]
    
    let items = [
        ("🎬🤩 3D Animatic Development 🤩🎬", "3D"),
        ("🖥😁 2D Animatic Development 😁🖥", "2D"),
        ("✏️🤓 Animation Techniques and Principles: 🤓✏️", "techniques"),
        ("🏃‍♂️🧐 Character Rigging 🧐🏃‍♂️", "rigging")
    ]
    
    let descriptions = [
        ("3D animation is currently the most popular form of animation in use. However, it is quite different from 2D animation. Unlike 3D animations, 2D animators create flat hand-drawn images with subtle changes that appear to move when viewed in a sequence."),
        ("2D animation refers to the creation of art and design in a flat environment. So they are still moving pictures but the characters and the background are all 2D. Compared to 3D, a 2D animation will only move, linearly from the middle, left to right, and up or down."),
        ("Both 2D and 3D animatic development rely on fundamental animation principles to create believable and appealing animations. These principles guide animators in aspects such as timing, motion, and character expression. Key principles include squash and stretch, anticipation, staging, follow-through, overlapping action, and exaggeration. By understanding and applying these principles, animators can create more engaging and dynamic animations in both 2D and 3D projects."),
        ("Character rigging is a vital step in both 2D and 3D animation processes, which involves creating a control system for the characters. This system allows animators to manipulate and animate the characters efficiently. In 2D animation, rigging typically consists of setting up a skeletal structure to control character movements. In 3D animation, rigging involves creating a more complex skeletal and control system, enabling animators to produce realistic and expressive character animations.")
    ]
    
    let ytLinks = [
        ("https://www.youtube.com/watch?v=-n9fo7jUMa0"),
        ("https://www.youtube.com/watch?v=HUngLgGRJpo"),
        ("https://www.youtube.com/watch?v=uDqjIdI4bF4"),
        ("https://www.youtube.com/watch?v=IJgAUkjsomA")
        
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

                
                HStack {
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex - 1 + items.count) % items.count
                        }
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        
                    }
                    
                    Button(action: {
                        withAnimation {
                            currentIndex = (currentIndex + 1) % items.count
                        }
                    }) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}
