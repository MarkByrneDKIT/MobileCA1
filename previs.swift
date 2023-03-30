//
//  gpt.swift
//  StoryboardingTadas
//
//  Created by Student on 22/03/2023.
//

import SwiftUI

struct PrevisViewCategory: View {
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
                VStack{Text("Pre-Visualistion").font(.title2).fontWeight(.heavy)
                HStack{
                    
                    VStack {
                        VStack{
                            Button(action: {
                                // Handle image tap
                                withAnimation{
                                    view1 = true
                                    
                                }
                                
                            }) {
                                Image("previs").resizable()
                                    .frame(width: imageres, height: imageres)
                                    .scaleEffect(1)
                                    .padding()
                                
                            }
                            Text("previsualisation").fontWeight(.medium)
                        }
                    }
                    VStack {
                        
                        Button(action: {
                            // Handle image tap
                            withAnimation{
                                view4 = true
                            }
                        }) {
                            Image("frameforge").resizable()
                                .frame(width: imageres, height: imageres)
                                .scaleEffect(1)
                                .padding()
                        }
                        Text("FrameForge").fontWeight(.medium)
                    }
                }
            }.sheet(isPresented: $view1, content: {
                TopicView5().transition(.customTransition)
            })
            .sheet(isPresented: $view2, content: {
                TopicView2().transition(.customTransition)
            })
            .sheet(isPresented: $view3, content: {
                TopicView3().transition(.customTransition)
            })
            .sheet(isPresented: $view4, content: {
                TopicView5().transition(.customTransition)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PrevisViewCategory()


    }
}
