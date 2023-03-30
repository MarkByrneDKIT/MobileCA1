//
//  gpt.swift
//  StoryboardingTadas
//
//  Created by Student on 22/03/2023.
//

import SwiftUI

struct AnimationDevViewCategory: View {
    @State private var view1 = false
    @State private var view2 = false
    @State private var view3 = false
    @State private var view4 = false
    @State private var view5 = false
    @State private var view6 = false
 private var imageres = CGFloat(150)
    var body: some View {
        
            ZStack {
                Image("orange")
                    .resizable()
                    
                    .edgesIgnoringSafeArea(.all)
                VStack{Text("2D/3D Animation Development").font(.title2).fontWeight(.heavy)
                HStack{
                    
                    VStack {
                        VStack{
                            Button(action: {
                                // Handle image tap
                                withAnimation{
                                    view1 = true
                                    
                                }
                                
                            }) {
                                Image("3D").resizable()
                                    .frame(width: imageres, height: imageres)
                                    .scaleEffect(1)
                                    .padding()
                                
                            }
                            Text("3d development").fontWeight(.heavy)
                        }
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view2 = true
                            }
                        }) {
                            Image("2D").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("2D Development").fontWeight(.heavy)
                        
                    }
                    VStack {
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view3 = true
                            }
                        }) {
                            Image("techniques").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Animation Techniques and Principles").fontWeight(.heavy)
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view4 = true
                            }
                        }) {
                            Image("rigging").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("Character Rigging").fontWeight(.heavy)
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimationDevView()
//    }
//}
