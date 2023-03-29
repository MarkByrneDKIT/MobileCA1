//
//  topic2.swift
//  test
//
//  Created by Student on 29/03/2023.
//

import Foundation
import SwiftUI

struct TopicView2: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            VStack {
                Text("This is topic 2").fontWeight(.medium)
                
                Button("Dismiss") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
