//
//  SettingsRowView.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/29/22.
//

import SwiftUI

struct SettingsRowView: View {
    
    var icon: SettingsIcon
    var title: String
    var viewToPresent: (any View)?
    
    @State private var showingTintColor = false
    
    var body: some View {
        HStack {
            SettingsIcon(icon: icon.icon, backgroundColor: icon.backgroundColor)
            Text(title)
        }.onTapGesture {
            showingTintColor.toggle()
        }
        .sheet(isPresented: $showingTintColor) {
            TintPickerView()
                .presentationDetents([.medium])
        }
        
    }
}

struct SettingsIcon: View, Hashable {
    
    var icon: String
    var backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .circular)
                .fill(backgroundColor)
                
            Image(systemName: icon).imageScale(.medium)
                .foregroundColor(Color.white)
            
        }.frame(width: 36, height: 36)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(icon: SettingsIcon(icon: "pin", backgroundColor: .blue), title: "Appearance", viewToPresent: nil)
    }
}
