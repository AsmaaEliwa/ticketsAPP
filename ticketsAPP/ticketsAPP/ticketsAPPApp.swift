//
//  ticketsAPPApp.swift
//  ticketsAPP
//
//  Created by asmaa gamal  on 15/01/2024.
//

import SwiftUI

@main
struct ticketsAPPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
