//
//  SharedSettings.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/31/22.
//

import SwiftUI

class SharedSettings: ObservableObject {
    @Published var tintColor = Color.green
    @Published var stepGoal = 10000
}
