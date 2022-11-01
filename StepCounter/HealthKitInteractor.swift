//
//  HealthKitInteractor.swift
//  StepCounter
//
//  Created by Jared Kozar on 10/22/22.
//

import Foundation
import HealthKit

extension Date {
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
}

enum StepPeriods {
    case today
    case pastWeek
    case pastThirtyDays
    case pastYear
    
    var startDate: Date {
        switch self {
            case .today:
                return Calendar.current.startOfDay(for: .now)
            case .pastWeek:
                return Calendar.current.date(byAdding: .day, value: -6, to: .now, wrappingComponents: false)!
            case .pastThirtyDays:
                return Calendar.current.date(byAdding: .day, value: -30, to: .now, wrappingComponents: false)!
        case .pastYear:
            return Calendar.current.date(byAdding: .day, value: -365, to: .now, wrappingComponents: false)!
        }
    }
    
    var intervalDate: Date {
        switch self {
        case .today, .pastWeek, .pastThirtyDays:
                return Calendar.current.startOfDay(for: .now)
            case .pastYear:
            return Date().startOfMonth()
        }
    }
    
    func returnDateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss 'UTC'"
        
        switch self {
            case .today:
            formatter.dateFormat = "HH"
            case .pastWeek, .pastThirtyDays:
            formatter.dateFormat = "MM/dd"
            case .pastYear:
            formatter.dateFormat = "MM"
        }
        
        return formatter.string(from: date)
    }
}

func getSteps(period: StepPeriods, completion: @escaping ([HealthStat]) -> Void) {
    authorizeHealthKit { (authorized, error) in
        print("SLLSLLS")
        guard authorized else { return }
        let healthStore = HKHealthStore()

        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        var healthStats = [HealthStat]()
        
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(
            quantityType: stepsQuantityType,
            quantitySamplePredicate: HKQuery.predicateForSamples(withStart: period.startDate, end: Date.now, options: .strictStartDate),
            options: [.cumulativeSum],
            anchorDate: period.intervalDate,
            intervalComponents: interval)
        
        query.initialResultsHandler = {
            query, results, error in
            
            results?.enumerateStatistics(from: period.startDate, to: Date.now, with: { (result, stop) in
                let stepCount = Int((result.sumQuantity()?.doubleValue(for: HKUnit.count())) ?? 0)
                let stat = HealthStat(stepCount: stepCount, date: period.returnDateFormat(date: result.startDate))
                healthStats.append(stat)
                print(result.startDate)
                DispatchQueue.main.async {
                    print("DLDLLL")
                    completion(healthStats)
                }
            })
        }
        
        healthStore.execute(query)
    }
}

private enum HealthkitSetupError: Error {
   case notAvailableOnDevice
   case dataTypeNotAvailable
 }
 
func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
   
   //1. Check to see if HealthKit Is Available on this device
   guard HKHealthStore.isHealthDataAvailable() else {
     completion(false, HealthkitSetupError.notAvailableOnDevice)
     return
   }
   //2. Prepare the data types that will interact with HealthKit
   guard   let distanceWalkingRunning = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
           let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount) else {
       
           completion(false, HealthkitSetupError.dataTypeNotAvailable)
           return
   }
   
   //3. Prepare a list of types you want HealthKit to read and write
   let healthKitTypesToWrite: Set<HKSampleType> = [distanceWalkingRunning,
                                                   stepCount]
   
   let healthKitTypesToRead: Set<HKObjectType> = [distanceWalkingRunning,
                                                  stepCount]
   
   //4. Request Authorization
   HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                        read: healthKitTypesToRead) { (success, error) in
     completion(success, error)
   }
 }
