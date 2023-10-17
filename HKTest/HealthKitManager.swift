//
//  HealthKitManager.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import Foundation
import HealthKit

class HealthKitManager {
    var healthStore: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        } else {
            print("unavailable to use HealthKit")
        }
    }
    
    func requestPermission() {
        //general
        if let healthStore = healthStore {
            var allTypes = Set<HKObjectType>()
            for element in HKQuantityTypeIdentifierTitles {
                allTypes.insert(HKObjectType.quantityType(forIdentifier: element)!)
            }
            
            for element in HKCategoryTypeIdentifierTitles {
                allTypes.insert(HKObjectType.categoryType(forIdentifier: element)!)
            }
            
            healthStore.requestAuthorization(toShare: nil, read: allTypes) { (success, error) in
                if let error = error {
                    debugPrint(error)
                } else {
                    print(success)
                }
            }
        }
    }
        
    func fetchData(_ input: HKQuantityTypeIdentifier) {
        guard let healthStore = healthStore else {
            return
        }
        
        guard let sampleType = HKSampleType.quantityType(forIdentifier: input) else {
            fatalError("*** This method should never fail ***")
        }
        //Int(HKObjectQueryNoLimit)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: nil) {
            query, results, error in
            
            guard let samples = results as? [HKQuantitySample] else {
                // Handle any errors here.
                print("????")
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                // Process each sample here.
                print("sample : ", sample.quantity)
            }
            
            // The results come back on an anonymous background queue.
            // Dispatch to the main queue before modifying the UI.
            
            DispatchQueue.main.async {
                // Update the UI here.
            }
        }
        
        healthStore.execute(query)

//        print(input)
//                
//        guard let healthStore = healthStore else {
//            return
//        }
//        let bodyMass1 = HKObjectType.quantityType(forIdentifier: input)
//        print(bodyMass1)
//        
//        
//        //1
//        guard let bodyMass = HKObjectType.quantityType(forIdentifier: input) else {
//            print("*** Unable to create a \(input.rawValue) ***")
//            return
//        }
//        
//        var interval = DateComponents()
//        interval.day = 1
//        
//        var anchorComponents = Calendar.current.dateComponents([.day, .month, .year], from: Date())
//        anchorComponents.hour = 0
//        let anchorDate = Calendar.current.date(from: anchorComponents)!
//        
//        let query1 = HKStatisticsCollectionQuery(quantityType: bodyMass,
//                                                    quantitySamplePredicate: nil,
//                                                    options: [.mostRecent],
//                                                    anchorDate: anchorDate,
//                                                    intervalComponents: interval)
//        
//        query1.initialResultsHandler = { _, results, error in
//                guard let results = results else {
//                    debugPrint(error as Any)
//                    return
//                }
//            print("results 1",results.statistics())
//        }
//        
//        healthStore.execute(query1)
    }
    
    func fetchData(_ input: HKCategoryTypeIdentifier) {
        guard let healthStore = healthStore else {
            return
        }
        
        guard let sampleType = HKSampleType.categoryType(forIdentifier: input) else {
            fatalError("*** This method should never fail ***")
        }
        //Int(HKObjectQueryNoLimit)
        let query = HKSampleQuery(sampleType: sampleType, predicate: nil, limit: 1, sortDescriptors: nil) {
            query, results, error in
            
            guard let samples = results as? [HKQuantitySample] else {
                // Handle any errors here.
                print("????")
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                // Process each sample here.
                print("sample : ", sample.quantity)
            }
            
            // The results come back on an anonymous background queue.
            // Dispatch to the main queue before modifying the UI.
            
            DispatchQueue.main.async {
                // Update the UI here.
            }
        }
        
        healthStore.execute(query)
    }
    
    func test() {
        let heightType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!
        let query = HKSampleQuery(sampleType: heightType, predicate: nil, limit: 1, sortDescriptors: nil) { (query, results, error) in
            if let result = results?.first as? HKQuantitySample{
                print("Height => \(result.quantity)")
            }else{
                print("OOPS didnt get height \nResults => \(results), error => \(error)")
            }
        }
        guard let healthStore = healthStore else {
            return
        }
        healthStore.execute(query)
    }
}
