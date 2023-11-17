//
//  SwiftUI_Combine_labsApp.swift
//  SwiftUI-Combine-labs
//
//  Created by 송영모 on 11/13/23.
//

import SwiftUI

@main
struct SwiftUI_Combine_labsApp: App {
    var body: some Scene {
        WindowGroup {
            List {
                Section {
                    ObservedObjectTestView()
                    NavigationLink("Basics") {
                      CounterDemoView()
                    }
                }
            }
        }
    }
}
