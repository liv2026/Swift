//
//  CatsOrDogsApp.swift
//  CatsOrDogs
//
//  Created by Lopes, Olivia on 4/8/24.
//

import SwiftUI

@main
struct CatsOrDogsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: AnimalModel())
        }
    }
}
