//
//  StateObjectTestView.swift
//  SwiftUI-Combine-labs
//
//  Created by 송영모 on 11/13/23.
//

import Foundation
import SwiftUI

class DataModel: ObservableObject {
    @Published var name = "Some Name"
    @Published var isEnabled = false
    
    init(name: String = "Some Name", isEnabled: Bool = false) {
        self.name = name
        self.isEnabled = isEnabled
    }
}


struct MyView: View {
    @StateObject private var model = DataModel()


    var body: some View {
        Text(model.name)
        MySubView()
            .environmentObject(model)
    }
}

struct MySubView: View {
    @EnvironmentObject var model: DataModel

    var body: some View {
        Toggle("Enabled", isOn: $model.isEnabled)
    }
}

struct MyInitializableView: View {
    @StateObject private var model: DataModel


    init(name: String) {
        _model = StateObject(wrappedValue: DataModel(name: name))
        print(name)
    }

    var body: some View {
        VStack {
            Text("Name: \(model.name)")
        }
    }
}

struct StateObjectTestView: View {
    @State var name1: String = "Ravi"
    @State var name2: String = "Maria"
    
    var body: some View {
        VStack {
            MyInitializableView(name: name1)
                .id(name1)
            
            MyInitializableView(name: name2)
                .foregroundStyle(.red)
                .id(name2)
            
            Text(name1)
            Text(name2)
            
            Button("이름 변경", action: {
                name1 = "Ravi \(Int.random(in: 0..<100))"
                name2 = "Maria \(Int.random(in: 0..<100))"
            })
        }
    }
}
