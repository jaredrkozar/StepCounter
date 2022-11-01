//
//  CustomButton.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/26/22.
//

import SwiftUI

struct CustomButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(9)
    }
}
