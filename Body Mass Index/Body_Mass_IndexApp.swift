//
//  Body_Mass_IndexApp.swift
//  Body Mass Index
//
//  Created by Ivan on 20/03/23.
//

import SwiftUI

@main
struct Body_Mass_IndexApp: App {
    @StateObject private var bmiController = BmiController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, bmiController.container.viewContext)
        }
    }
}
