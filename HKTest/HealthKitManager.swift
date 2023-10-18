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
        
    func fetchData(_ input: HKQuantityTypeIdentifier, completion: @escaping ([String]) -> Void) {
        var returnStr: [String] = []

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
                debugPrint(error?.localizedDescription as Any)
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                returnStr.append("\(sample.quantity)")
            }

            DispatchQueue.main.async {
                completion(returnStr)
            }
            
        }
        healthStore.execute(query)
    }
    
    func fetchData(_ input: HKCategoryTypeIdentifier, completion: @escaping ([String]) -> Void) {
        var returnStr: [String] = []
        
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
                debugPrint(error?.localizedDescription as Any)
                return
            }
            print("number of samples : ", samples.count)
            for sample in samples {
                returnStr.append("\(sample.quantity)")
            }

            DispatchQueue.main.async {
                completion(returnStr)
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
