//
//  StepCounterApp.swift
//  StepCounter
//
//  Created by Jared Kozar on 8/22/22.
//

import SwiftUI

@main
struct StepCounterApp: App {
    @StateObject var currentTheme = SharedSettings()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(currentTheme)
        }
    }
}
