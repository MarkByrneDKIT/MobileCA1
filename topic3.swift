//
//  topic2.swift
//  test
//
//  Created by Student on 29/03/2023.
//

import Foundation
import SwiftUI

struct TopicView3: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.purple
                .ignoresSafeArea()
            VStack {
                Text("This is topic 3").fontWeight(.black)
                
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
