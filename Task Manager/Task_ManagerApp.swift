//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by Vladislav Tereshchenko on 22.05.2022.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
