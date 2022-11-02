//
//  SettingsVIew.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/23/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingTintColor = false
    
    @State private var appearanceSettings = [
        SettingsRowView(icon: SettingsIcon(icon: "paintpalette", backgroundColor: .blue), title: "Tint Color", viewToPresent: TintPickerView())
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance")) {
                    ForEach(appearanceSettings, id: \.icon) { setting in
                        setting
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsVIew_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
