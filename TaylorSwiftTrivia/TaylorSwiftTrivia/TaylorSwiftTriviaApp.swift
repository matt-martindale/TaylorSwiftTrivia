//
//  TaylorSwiftTriviaApp.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

@main
struct TaylorSwiftTriviaApp: App {
    let persistence = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
