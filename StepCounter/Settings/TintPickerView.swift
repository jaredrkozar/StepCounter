//
//  TintPickerView.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/31/22.
//

import SwiftUI

struct TintPickerView: View {
    var colors = [Color.red, Color.orange, Color.blue, Color.green, Color.indigo, Color.purple, Color.white]
    
    @EnvironmentObject var settings: SharedSettings
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], content: {
                    
                    ForEach(colors, id: \.self) { color in
                        
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(color)
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                settings.tintColor = color
                            }
                    }
                })
                .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
            }
        }
        .navigationTitle("Tint Color")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TintPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TintPickerView()
    }
}
