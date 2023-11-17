//
//  00-Combine-ObservedObject.swift
//  SwiftUI-labs
//
//  Created by 송영모 on 11/17/23.
//

import Foundation
import SwiftUI

class ObservableObjectMock: ObservableObject {
    @Published var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
}

struct ObservedObjectCell: View {
    let title: String
    @StateObject var model: ObservableObjectMock
    
    init(title: String, model: ObservableObjectMock = ObservableObjectMock()) {
        self._model = .init(wrappedValue: model)
        self.title = title
        print("[+] inited \(title) \(model.count)")
    }
    
    init(title: String, count: Int) {
        self._model = .init(wrappedValue: .init(count: count))
        self.title = title
        print("[+] inited \(title) \(count)")
    }
    
    var body: some View {
        HStack(spacing: 40) {
            let _ = print("[+] updated \(title) \(model.count)")
            
            Text("ObservedObjectCell \(title): \(model.count)")
                .font(.callout)
            
            HStack {
                Button("", systemImage: "minus", action: {
                    model.count += -1
                })
                
                Button("", systemImage: "plus", action: {
                    model.count += 1
                })
            }
        }
    }
}

struct ObservedObjectView: View {
    @ObservedObject var model = ObservableObjectMock()
    
    var body: some View {
        VStack {
            let _ = print("======================")
            
            Text("View: \(model.count)")
            
            HStack {
                Button("", systemImage: "minus", action: {
                    model.count += -1
                })
                
                Button("", systemImage: "plus", action: {
                    model.count += 1
                })
            }
            .padding(.bottom, 40)
            
            VStack(alignment: .leading) {
                ObservedObjectCell(title: "self count", count: self.model.count)
                ObservedObjectCell(title: "self model", model: self.model)
                ObservedObjectCell(title: "new count", count: 0)
                ObservedObjectCell(title: "new model", model : .init())
            }
            .padding(.bottom, 20)
            
            let _ = print("======================")
        }
        .padding()
    }
}
