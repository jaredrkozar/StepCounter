//
//  SettingsRowView.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/29/22.
//

import SwiftUI

struct SettingsRowView: View {
    
    var icon: String
    var backgroundColor: Color
    var title: String
    var optionLabel: String?
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .circular)
                    .fill(backgroundColor)
                    
                Image(systemName: icon).imageScale(.medium)
                    .foregroundColor(Color.white)
                
            }.frame(width: 36, height: 36)
            Text(title)
            Spacer()
            Text(optionLabel ?? "").foregroundColor(Color.gray)
        }
        
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(icon: "pin", backgroundColor: Color.green, title: "KK", optionLabel: "nil")
    }
}
