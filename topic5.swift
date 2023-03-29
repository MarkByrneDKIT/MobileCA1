//
//  topic2.swift
//  test
//
//  Created by Student on 29/03/2023.
//

import Foundation
import SwiftUI

struct TopicView5: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                Text("This is topic 5").fontWeight(.light)
                
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
