//
//  ContentView.swift
//  test
//
//  Created by Student on 09/02/2023.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title2)
            .foregroundColor(Color.white)
            .frame(width:150, height: 120, alignment: .center)
            .background(configuration.isPressed ? Color.green.opacity(0.5) : Color.green)
            .cornerRadius(8)
            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0) //<- change scale value as per need. scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            
    }
}



struct ContentView: View {
    @State private var showDetail = false

    var body: some View {
        let imageres = CGFloat(110);
        VStack {
            Button {
                showDetail.toggle()
            } label: {
                Label("Graph", systemImage: "chevron.right.circle")
                    .labelStyle(.iconOnly)
                    .imageScale(.large)
                    .rotationEffect(.degrees(showDetail ? 90 : 0))
                    .scaleEffect(showDetail ? 1.5 : 1)
                    .padding()
                    .animation(.easeIn(duration:0.5), value: showDetail)
            }
            Text("Previsualisation").bold().font(.largeTitle)
            HStack{
                Button(action: {
                    // Handle image tap
                    showDetail.toggle()
                }) {
                    Image("hello").resizable()
                        .frame(width: imageres, height: imageres)
                        .rotationEffect(.degrees(showDetail ? 360 : 0))
                        .scaleEffect(showDetail ? 2 : 1)
                        .padding()
                        .animation(.easeIn(duration:0.5), value: showDetail)
                }
                Button(action: {
                    // Handle image tap
                }) {
                    Image("hello")
                        .resizable()
                        .frame(width: imageres, height: imageres)
                        .opacity(showDetail ? 1.0 : 0.0)
                        .animation(.easeOut(duration:1), value: showDetail)
                }
            }
            HStack{Button(action: {
                // Handle image tap
            }) {
                Image("hello")
                    .resizable()
                    .frame(width: imageres, height: imageres)
            }
                Button(action: {
                    // Handle image tap
                }) {
                    Image("hello")
                        .resizable()
                        .frame(width: imageres, height: imageres)
                }
            }
            HStack{Button(action: {
                // Handle image tap
            }) {
                Image("hello")
                    .resizable()
                    .frame(width: imageres, height: imageres)
            }
                Button(action: {
                    // Handle image tap
                }) {
                    Image("hello")
                        .resizable()
                        .frame(width: imageres, height: imageres)
                }
            }
            
        }
        
    }
}

struct ContentView2: View {
    @State private var showDetail = false
    var body: some View {
        
        let imageres = CGFloat(150)
        VStack{
            NavigationView {
                VStack{
                    Text("Welcome to Screen 1!")
                    
                    HStack {
                        
                        NavigationLink(
                            
                            destination: SecondScreen(),
                            label: {
                                Button(action:{}){Image("hello")}
                                Image("hello")
                                    .resizable()
                                    .frame(width: imageres, height: imageres)
                                
                            }).buttonStyle(ThemeAnimationStyle())
                        
                        NavigationLink(
                            destination: ThirdScreen(),
                            label: {
                                Button(action: {
                                // Handle image tap
                                showDetail.toggle()
                            }) {
                                Image("hello").resizable()
                                    .frame(width: imageres, height: imageres)
                                    .rotationEffect(.degrees(showDetail ? 360 : 0))
                                    .scaleEffect(showDetail ? 2 : 1)
                                    .padding()
                                    .animation(.easeIn(duration:0.5), value: showDetail)
                            }})
                    }
                    .navigationTitle("Screen 1")
                    
                }
            }
            
        }
    }}
    
struct SecondScreen: View {
    @State private var showText = false

    var body: some View {
        VStack {
            if showText {
                Text("You have arrived!")
                    .opacity(showText ? 1 : 0)
                    
                    
            }
        }
        .navigationTitle("Screen 2")
        .onAppear {
                showText = true
            
        }
    }
}


struct ThirdScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to Screen 3!")
            Text("You have arrived!!!!")
        }
        .navigationTitle("Screen 3")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//        
//        
//    }
//}

