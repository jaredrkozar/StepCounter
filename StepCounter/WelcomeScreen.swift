//
//  WelcomeScreen.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/26/22.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Text("Welcome to StepCounter!")
                .font(.title)
            
            Text("StepCounter is an app that can help you track your steps and motivates you to get outside more")
                .font(.body)
        }
        
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
