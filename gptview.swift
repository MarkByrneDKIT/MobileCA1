//
//  gpt.swift
//  StoryboardingTadas
//
//  Created by Student on 22/03/2023.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView21()
        
        
    }
}
