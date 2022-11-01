//
//  ContentView.swift
//  StepCounter
//
//  Created by Jared Kozar on 8/22/22.
//

import SwiftUI
import Charts
import HealthKit

struct ContentView: View {
    @EnvironmentObject var theme: SharedSettings
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Summary", systemImage: "figure.walk")
                }

            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .toolbarBackground(theme.tintColor, for: .bottomBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
