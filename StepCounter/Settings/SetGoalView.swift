//
//  SetGoalView.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/31/22.
//

import SwiftUI

struct SetGoalView: View {
    @EnvironmentObject var settings: SharedSettings
    var body: some View {
        VStack {
            Text("Step Goal:")
            
            Text("\(settings.stepGoal)")
            Spacer()
            
            HStack {
                GoalButton(title: "-", color: Color.green, action: {
                    settings.stepGoal -= 500
                })
                
                GoalButton(title: "+", color: Color.green, action: {
                    settings.stepGoal -= 500
                })
            }
           
        }
    }
}

struct SetGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetGoalView()
    }
}

struct GoalButton: View {
    
    let title: String
    var color: Color
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(9)
    }
}
