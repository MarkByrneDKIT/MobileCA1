//
//  topic2.swift
//  test
//
//  Created by Student on 29/03/2023.
//

import Foundation
import SwiftUI

struct TopicView6: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
                Text("This is topic 6").fontWeight(.black)
                
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
