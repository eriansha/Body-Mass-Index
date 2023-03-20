//
//  Body_Mass_IndexApp.swift
//  Body Mass Index
//
//  Created by Ivan on 20/03/23.
//

import SwiftUI

@main
struct Body_Mass_IndexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
