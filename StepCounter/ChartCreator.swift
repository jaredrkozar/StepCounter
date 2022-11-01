//
//  ChartCreator.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/27/22.
//

import SwiftUI
import Charts

struct ChartCreator: View {
    
    @EnvironmentObject var theme: SharedSettings
    var data: [HealthStat]?
    var body: some View {
        Chart {
            ForEach(data!) { datum in
                BarMark(
                    x: .value("Mount", datum.date ?? ":"),
                    y: .value("Value", datum.stepCount ?? 0)
                )
            }
            .foregroundStyle(theme.tintColor.gradient)
        }
    }
}

struct ChartCreator_Previews: PreviewProvider {
    static var previews: some View {
        ChartCreator()
    }
}
