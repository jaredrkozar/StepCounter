//
//  HealthStat.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/28/22.
//

import Foundation
import HealthKit

struct HealthStat: Identifiable {
    var id = UUID()
    var stepCount: Int?
    var date: String?
}
