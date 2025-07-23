//
//  ToDOListApp.swift
//  ToDOList
//
//  Created by kirill on 23.07.2025.
//

import SwiftUI

@main
struct ToDOListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
