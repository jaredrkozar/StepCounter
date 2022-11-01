//
//  SettingsVIew.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/23/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingTintColor = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Important tasks")) {
                    SettingsRowView(icon: "paintpalette", backgroundColor: Color.green, title: "LKLL")
                }
                .sheet(isPresented: $showingTintColor) {
                    TintPickerView()
                        .presentationDetents([.medium])
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
