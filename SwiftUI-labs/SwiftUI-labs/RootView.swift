//
//  RootView.swift
//  SwiftUI-labs
//
//  Created by 송영모 on 11/17/23.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink("ObservedObject") {
                        ObservedObjectView()
                    }
                } header: {
                    Text("Basic")
                }
            }
        }
    }
}
