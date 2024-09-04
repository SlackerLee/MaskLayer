//
//  MaskLayerApp.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

@main
struct MaskLayerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
