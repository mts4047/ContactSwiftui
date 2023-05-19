//
//  ContactSwiftuiApp.swift
//  ContactSwiftui
//
//  Created by Myo Thandar soe on 01/04/2023.
//

import SwiftUI

@main
struct ContactSwiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContactListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
