import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var isImageExpanded = false
    @State private var opacity = 0.0
    @State private var rotationDegrees = 0.0
    
    var body: some View {
        ZStack{
            NavigationView {
                VStack {
                    Text("Homepage")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.top)

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 20) {
                        NavigationButton(title: "StoryBoarding", imageName: "eyes", destination: SecondView(), rotationDegrees: $rotationDegrees)
                        NavigationButton(title: "Pre-Visualistion", imageName: "pencil", destination: SecondView(), rotationDegrees: $rotationDegrees)
                        NavigationButton(title: "2D/3D Animation", imageName: "eyes", destination: SecondView(), rotationDegrees: $rotationDegrees)
                    }
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1.5), value: opacity)
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
                .onAppear {
                    opacity = 1.0
                    rotationDegrees = 360.0
                    requestNotificationPermission()
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
    }
}

struct NavigationButton<Destination: View>: View {
    let title: String
    let imageName: String
    let destination: Destination
    @Binding var rotationDegrees: Double
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)

                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 110)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .rotationEffect(.degrees(rotationDegrees))
                    .animation(.easeInOut(duration: 1.5), value: rotationDegrees)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .transition(.move(edge: .bottom).combined(with: .opacity))
        .animation(.spring(), value: rotationDegrees)
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("You're now on the second screen!")
                .font(.largeTitle)
                .padding()

            Button(action: {
                sendNotification(with: "Notification from Second View")
            }) {
                Text("Send Notification")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
    
    func sendNotification(with text: String) {
        let content = UNMutableNotificationContent()
        content.title = "Hey Come Back!"
        content.subtitle = "Check out Storyboarding"
        content.body = "We have Tutorials!"
        content.sound = UNNotificationSound.default
        
        let imageName = "DT"
        if let imageURL = Bundle.main.url(forResource: "StoryBoarding", withExtension: "png") {
            let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
            content.attachments = [attachment]
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: "com.devtechie.notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        SecondView()
    }
}
