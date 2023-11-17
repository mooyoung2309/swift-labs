//
//  ContentView.swift
//  SwiftUI-Combine-labs
//
//  Created by 송영모 on 11/13/23.
//

import SwiftUI
import Combine

class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        self.objectWillChange.send()
    }


    func haveBirthday() -> Int {
        age += 1
        return age
    }
}
