//
//  ObservableObjectTestView.swift
//  SwiftUI-Combine-labs
//
//  Created by 송영모 on 11/13/23.
//

import Foundation
import SwiftUI
import Combine

class ObservableObjectTestModel: ObservableObject {
    @Published var number: Int = 0
    
    init() { }
}

struct ObservableObjectTestView: View {
    @ObservedObject var model = ObservableObjectTestModel()
    
    var body: some View {
        Text("number: \(model.number)")
        
        HStack {
            Button("", systemImage: "plus", action: {
                model.number += 1
            })
            Button("", systemImage: "minus", action: { 
                model.number -= 1
            })
        }
    }
}
