//
//  topic2.swift
//  test
//
//  Created by Student on 29/03/2023.
//

import Foundation
import SwiftUI

struct TopicView1: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                Text("This is topic 1").fontWeight(.heavy)
                
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
