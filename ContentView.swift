//
//  ContentView.swift
//  dean_storyboard_previs
//
//  Created by Student on 21/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    @State private var currentIndex = 0
    
    let images = ["2D", "3D"]
    
    let items = [
        ("🖥😁 2D Animatic Development 😁🖥", "2D"),
        ("🎬🤩 3D Animatic Development 🤩🎬", "3D")
    ]
    
    let descriptions = [
        ("2D animation refers to the creation of art and design in a flat environment. So they are still moving pictures but the characters and the background are all 2D. Compared to 3D, a 2D animation will only move, linearly from the middle, left to right, and up or down."),
        ("3D animation is currently the most popular form of animation in use. However, it is quite different from 2D animation. Unlike 3D animations, 2D animators create flat hand-drawn images with subtle changes that appear to move when viewed in a sequence.")    ]
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect() // change slide every 10 seconds
    
    let transition = AnyTransition.opacity.animation(.easeInOut(duration: 2))
    
    
    var body: some View {
        

        ZStack{
            Image("orange")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
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
                        withAnimation{
                            self.showDetails.toggle()
                        }
                    }
                    .transition(.scale)
                ScrollView{
                    Text(descriptions[currentIndex])
                        .frame(width: 350)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(radius:5)
                        .transition(AnyTransition.slide)
                        .animation(.easeInOut(duration: 1)) // Add animation to the slide transition                    }
                    
                }
                .transition(.slide)
            }
            
            
            .onReceive(timer) { _ in
                let nextIndex = (currentIndex + 1) % items.count
                currentIndex = nextIndex
            }
            
            //                Group{
            //                    if showDetails {
            //                        VStack{
            //                            ScrollView{
            //                                Text("2D animation refers to the creation of art and design in a flat environment. So they are still moving pictures but the characters and the background are all 2D. Compared to 3D, a 2D animation will only move, linearly from the middle, left to right, and up or down.")
            //                                    .frame(width: 350)
            //                                    .padding()
            //                                    .background(Color.orange)
            //                                    .cornerRadius(10)
            //                                    .shadow(radius:5)
            //                            }
            //                        }
            //                        .transition(.opacity)
            //                    }
            //                }
            
            
            
            
        }
    }
    
}
