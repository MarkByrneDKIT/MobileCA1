//
//  gpt.swift
//  StoryboardingTadas
//
//  Created by Student on 22/03/2023.
//

import SwiftUI

struct AppButton<TargetView: View>: View {
    let ImageName: String
    let TopicName: String
    let imageres = CGFloat(150)
    @State private var isAnimating: Bool = false
    @State private var isActive: Bool = false
    @State private var isLabelVisible: Bool = false
    
    var body: some View {
        VStack{
            
                Image(ImageName).resizable()
                    .frame(width: imageres, height: imageres)
                    .scaleEffect(1)
                    .padding()
            Text(TopicName).fontWeight(.medium)
        }
        
    }
}

struct ContentView21: View {
    @State private var isShowingNewScreen = false
    @State private var view1 = false
    @State private var view2 = false
    @State private var view3 = false
    @State private var view4 = false
    @State private var view5 = false
    @State private var view6 = false
 private var imageres = CGFloat(150)
    var body: some View {
        
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                VStack{Text("TITLE TEXT THATS REALLY LONG").font(.largeTitle).fontWeight(.heavy)
                HStack{
                    
                    VStack {
                        VStack{
                            Button(action: {
                                // Handle image tap
                                withAnimation{
                                    view1 = true
                                }
                                
                            }) {
                                Image("one").resizable()
                                    .frame(width: imageres, height: imageres)
                                    .scaleEffect(1)
                                    .padding()
                                
                            }
                            Text("Topic 1").fontWeight(.medium)
                        }
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view2 = true
                            }
                        }) {
                            Image("two").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Topic 2").fontWeight(.medium)
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view3 = true
                            }
                        }) {
                            Image("three").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Topic 3").fontWeight(.medium)
                    }
                    VStack {
                        
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view4 = true
                            }
                        }) {
                            Image("four").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Topic 4").fontWeight(.medium)
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view5 = true
                            }
                        }) {
                            Image("five").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Topic 5").fontWeight(.medium)
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view6 = true
                            }
                        }) {
                            Image("six").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Topic 6").fontWeight(.medium)
                    }
                }
            }.sheet(isPresented: $view1, content: {
                TopicView1().transition(.customTransition)
                
            })
            .sheet(isPresented: $view2, content: {
                TopicView2().transition(.customTransition)
            })
            .sheet(isPresented: $view3, content: {
                TopicView3().transition(.customTransition)
            })
            .sheet(isPresented: $view4, content: {
                TopicView4().transition(.customTransition)
            })
            .sheet(isPresented: $view5, content: {
                TopicView5().transition(.customTransition)
            })
            .sheet(isPresented: $view6, content: {
                TopicView6().transition(.customTransition)
            })
        }
    }
}

extension AnyTransition {
    static var customTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top).combined(with: .opacity)
        let removal = AnyTransition.move(edge: .top).combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct TransitionView2: View {
    @State private var showSecondView = false

    var body: some View {
            VStack {
                Button("Toggle Second View") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.showSecondView.toggle()
                    }
                }

                if showSecondView {
                    SecondView()
                        .transition(.asymmetric(insertion: .scale(scale: 0, anchor: .center).combined(with: .opacity), removal: .scale(scale: 0, anchor: .center).combined(with: .opacity)))
                }
            }
        }
}

struct TransitionView3: View {
    @State private var showSecondView = false

    var body: some View {
        VStack {
            Button("Toggle Second View") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showSecondView.toggle()
                }
            }

            if showSecondView {
                SecondView()
                    .transition(.slide)
            }
        }
    }
}

struct TransitionView4: View {
    @State private var showSecondView = false

    var body: some View {
        VStack {
            Button("Toggle Second View") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showSecondView.toggle()
                }
            }

            if showSecondView {
                SecondView()
                    .transition(.asymmetric(
                        insertion: AnyTransition.opacity.combined(with: AnyTransition.modifier(active: Rotation3DModifier(degrees: 180, axis: (x: 1, y: 0, z: 0)), identity: Rotation3DModifier(degrees: 0, axis: (x: 1, y: 0, z: 0)))),
                        removal: AnyTransition.opacity.combined(with: AnyTransition.modifier(active: Rotation3DModifier(degrees: 180, axis: (x: 1, y: 0, z: 0)), identity: Rotation3DModifier(degrees: 0, axis: (x: 1, y: 0, z: 0))))
                    ))
            }
        }
    }
}

struct TransitionView5: View {
    @State private var showSecondView = false

    var body: some View {
        VStack {
            Button("Toggle Second View") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showSecondView.toggle()
                }
            }

            if showSecondView {
                SecondView()
                    .transition(.asymmetric(
                        insertion: AnyTransition.move(edge: .trailing).combined(with: AnyTransition.scale(scale: 0.1).animation(.spring())),
                        removal: AnyTransition.move(edge: .leading).combined(with: AnyTransition.scale(scale: 0.1).animation(.spring()))
                    ))
            }
        }
    }
}

struct TransitionView6: View {
    @State private var showSecondView = false

    var body: some View {
        VStack {
            Button("Toggle Second View") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.showSecondView.toggle()
                }
            }

            if showSecondView {
                SecondView()
                    .transition(.asymmetric(
                        insertion: AnyTransition.slide.combined(with: AnyTransition.rotationEffect(Angle(degrees: 360))),
                        removal: AnyTransition.slide.combined(with: AnyTransition.rotationEffect(Angle(degrees: -360)))
                    ))
            }
        }
    }
}

struct Rotation3DModifier: ViewModifier {
    let degrees: Double
    let axis: (x: CGFloat, y: CGFloat, z: CGFloat)

    func body(content: Content) -> some View {
        content.rotation3DEffect(Angle(degrees: degrees), axis: axis)
    }
}

struct SecondView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 200, height: 200)
            .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView6()
        
        
    }
}
