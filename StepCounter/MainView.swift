//
//  SwiftUIView.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/23/22.
//

import SwiftUI
import HealthKit

struct MainView: View {
    @State private var steps: String?
    @State private var stepsArray: [HealthStat]?
    @EnvironmentObject var theme: SharedSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Text(steps ?? "getting distance")
                    .foregroundColor(theme.tintColor)
                    .font(.system(size: 60))
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 170)
                ScrollView(.horizontal) {
                    ChartCreator(data: stepsArray ?? [HealthStat(id: UUID(), stepCount: 4444, date: "")])
                        .frame(width: 400, height: 325)

                }
                .frame(width: 400, height: 350)
            }
            
            .onAppear {
                getSteps(period: .pastWeek, completion: {result in
                    steps = "\(result.last!.stepCount ?? 0)"
                    stepsArray = result
                })
            }
            .navigationTitle("Main Summary")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
